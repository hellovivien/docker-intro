FROM python:3
ADD app.py /
RUN pip install streamlit
CMD [ "streamlit", "run", "./app.py" ]