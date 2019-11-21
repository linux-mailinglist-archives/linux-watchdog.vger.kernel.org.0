Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4C9105376
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 14:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUNp6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 08:45:58 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1141 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726293AbfKUNp6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 08:45:58 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xALDXGeL030461;
        Thu, 21 Nov 2019 14:45:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Mm2zh02uhoiw1aOvwth48MJJ0pCk1PHprbmrmwggVkc=;
 b=sQj3GCHRfN+DP0UGyBm0AGX6zP9pc6/5Air7fdnv5Zr+W015YNGxuD2Xme5ZxD9kYAo3
 U4QnU/hIE1kaXCOJXt3oi2Z1ZjnSuA8Od6uX7w6cnACT+2mJ3m3MyJFXxmJwZuACCiFZ
 ETVAq4NGk+b66m4ei1j6n0x0KHd6XpWU54WEICQqqbTSwHNX7S1aJbu0vfixztsduSO8
 QUfxdkGS2k3F894rWI48aTgv7h6nK9ALwammABBj7qVVcdd+/L6FJSjRiZZw9KS/nd+g
 pv7zqsBxdyODBoQ1O1LA0MRBpg+Pp8ThlTOAb8F9btI6pRxoCzznAAmtED3A+yfee55C TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wa9ujbkb4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Nov 2019 14:45:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC51B10002A;
        Thu, 21 Nov 2019 14:45:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB2542C085C;
        Thu, 21 Nov 2019 14:45:21 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 14:45:21 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 21 Nov 2019 14:45:21 +0100
From:   Christophe ROULLIER <christophe.roullier@st.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at
 probe
Thread-Topic: [PATCH 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING
 at probe
Thread-Index: AQHVoFGOXOrRJMFkVkmWAcwXxdj4CaeVkmWA
Date:   Thu, 21 Nov 2019 13:45:21 +0000
Message-ID: <550566ff-31bd-1f40-63d1-67b013f8be75@st.com>
References: <20191121082813.29267-1-christophe.roullier@st.com>
 <20191121082813.29267-2-christophe.roullier@st.com>
 <ce10681c-8fa3-0fa6-3509-376a2f37aec9@roeck-us.net>
In-Reply-To: <ce10681c-8fa3-0fa6-3509-376a2f37aec9@roeck-us.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <921B89BA38567E499A7F44A4CCAEAFFD@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KT24gMTEvMjEvMTkgMTA6NTMgQU0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
DQo+IE9uIDExLzIxLzE5IDEyOjI4IEFNLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOg0KPj4g
SWYgdGhlIHdhdGNoZG9nIGhhcmR3YXJlIGlzIGFscmVhZHkgZW5hYmxlZCBkdXJpbmcgdGhlIGJv
b3QgcHJvY2VzcywNCj4+IHdoZW4gdGhlIExpbnV4IHdhdGNoZG9nIGRyaXZlciBsb2FkcywgaXQg
c2hvdWxkIHJlc2V0IHRoZSB3YXRjaGRvZyBhbmQNCj4+IHRlbGwgdGhlIHdhdGNoZG9nIGZyYW1l
d29yay4gQXMgYSByZXN1bHQsIHBpbmcgY2FuIGJlIGdlbmVyYXRlZCBmcm9tDQo+PiB0aGUgd2F0
Y2hkb2cgZnJhbWV3b3JrIChpZiBDT05GSUdfV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRCBp
cyBzZXQpLA0KPj4gdW50aWwgdGhlIHVzZXJzcGFjZSB3YXRjaGRvZyBkYWVtb24gdGFrZXMgb3Zl
ciBjb250cm9sDQo+Pg0KPg0KPiBUaGlzIGlzIG5vdCB3aGF0IHRoZSBjb2RlIGlzIGRvaW5nLiBJ
dCBzZXRzIHRoZSBXRE9HX0hXX1JVTk5JTkcgZmxhZw0KPiB1bmNvbmRpdGlvbmFsbHksIG5vIG1h
dHRlciBpZiB0aGUgd2F0Y2hkb2cgaXMgYWxyZWFkeSBydW5uaW5nIG9yIG5vdC4NCj4gSXQgYWxz
byBjaGFuZ2VzIHRoZSBzZW1hbnRpYyBvZiB0aGUgcmVzdCBvZiB0aGUgY29kZSwgYXMgd2VsbCBh
cw0KPiBmdW5jdGlvbmFsaXR5LiBUaGUgY29kZSBpbiBzdGFydF90aW1lb3V0IG5vIGxvbmdlciB3
YWl0cywgYW5kIHRoZSBwaW5nDQo+IGNvZGUgZXhwbGljaXRseSAocmUtKWVuYWJsZXMgdGhlIHdh
dGNoZG9nLg0KPg0KPiBJZiB5b3Ugd2FudCBhbiBvcHRpb24gdG8gc3RhcnQgdGhlIHdhdGNoZG9n
IGF0IHByb2JlIHRpbWUgDQo+IHVuY29uZGl0aW9uYWxseSwNCj4gcGxlYXNlIGFkZCBhIG1vZHVs
ZSBwYXJhbWV0ZXIgdG8gZG8gaXQuIE90aGVyd2lzZSB5b3UnbGwgbmVlZCB0byBjaGVjayBpZg0K
PiBpdCBpcyBpbmRlZWQgZW5hYmxlZCBiZWZvcmUgc2V0dGluZyBXRE9HX0hXX1JVTk5JTkcsIGFu
ZCBpbiB0aGF0IGNhc2UgaXQNCj4gc2hvdWxkIG5vdCBiZSBuZWNlc3NhcnkgdG8gcmUtZW5hYmxl
IGl0LiBJdCBzaG91bGQgYWxzbyBub3QgYmUgbmVjZXNzYXJ5DQo+IHRvIHNwbGl0IHRoZSBzdGFy
dCBmdW5jdGlvbi4NCg0KV2l0aCBvdXIgSVdERyBJUCwgdGhlcmUgaXMgbm8gd2F5IHRvIHJlYWQg
dmFsdWVzIGZyb20gaGFyZHdhcmUgKGlmIGl0IGlzIA0KcnVubmluZyBvciBub3QpDQoNCldlIGFy
ZSBpbiBzYW1lIGNhc2Ugb2YgaW50ZWwtbWlkX3dkdC5jIGRyaXZlciwgd2UgaGF2ZSBVYm9vdCB3
aGljaCBjYW4NCg0KbGVhdmVzIHRoZSB3YXRjaGRvZyBydW5uaW5nLiBTbyB3ZSBuZWVkIHRvIGZv
cmNlIHRoZSBraWNraW5nIG9mIG91ciANCndhdGNoZG9nLg0KDQpUaGFua3MNCg0KQ2hyaXN0b3Bo
ZQ0KDQo+DQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KPg0KPj4gRml4ZXM6NDMzMmQxMTNjNjZhICgi
d2F0Y2hkb2c6IEFkZCBTVE0zMiBJV0RHIGRyaXZlciIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4NCj4+IC0tLQ0KPj4g
wqAgZHJpdmVycy93YXRjaGRvZy9zdG0zMl9pd2RnLmMgfCA1NyArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDE3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL3N0
bTMyX2l3ZGcuYyANCj4+IGIvZHJpdmVycy93YXRjaGRvZy9zdG0zMl9pd2RnLmMNCj4+IGluZGV4
IGEzYTMyOTAxMWEwNi4uMmIzYmUzYjFjMTViIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy93YXRj
aGRvZy9zdG0zMl9pd2RnLmMNCj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5j
DQo+PiBAQCAtODcsOCArODcsMjMgQEAgc3RhdGljIGlubGluZSB2b2lkIHJlZ193cml0ZSh2b2lk
IF9faW9tZW0gKmJhc2UsIA0KPj4gdTMyIHJlZywgdTMyIHZhbCkNCj4+IMKgIHN0YXRpYyBpbnQg
c3RtMzJfaXdkZ19zdGFydChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQpDQo+PiDCoCB7DQo+
PiDCoMKgwqDCoMKgIHN0cnVjdCBzdG0zMl9pd2RnICp3ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0
YSh3ZGQpOw0KPj4gLcKgwqDCoCB1MzIgdG91dCwgcHJlc2MsIGl3ZGdfcmxyLCBpd2RnX3ByLCBp
d2RnX3NyOw0KPj4gLcKgwqDCoCBpbnQgcmV0Ow0KPj4gKw0KPj4gK8KgwqDCoCBkZXZfZGJnKHdk
ZC0+cGFyZW50LCAiJXNcbiIsIF9fZnVuY19fKTsNCj4+ICsNCj4+ICvCoMKgwqAgLyrCoCBTdGFy
dCB0aGUgd2F0Y2hkb2cgKi8NCj4+ICvCoMKgwqAgcmVnX3dyaXRlKHdkdC0+cmVncywgSVdER19L
UiwgS1JfS0VZX0VOQUJMRSk7DQo+PiArDQo+PiArwqDCoMKgIC8qIHJlbG9hZCB3YXRjaGRvZyAq
Lw0KPj4gK8KgwqDCoCByZWdfd3JpdGUod2R0LT5yZWdzLCBJV0RHX0tSLCBLUl9LRVlfUkVMT0FE
KTsNCj4+ICsNCj4+ICvCoMKgwqAgc2V0X2JpdChXRE9HX0hXX1JVTk5JTkcsICZ3ZGQtPnN0YXR1
cyk7DQo+PiArwqDCoMKgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHN0
bTMyX2l3ZGdfc2V0cHJlc2NhbGVyKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4+ICt7
DQo+PiArwqDCoMKgIHN0cnVjdCBzdG0zMl9pd2RnICp3ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0
YSh3ZGQpOw0KPj4gK8KgwqDCoCB1MzIgdG91dCwgcHJlc2MsIGl3ZGdfcmxyLCBpd2RnX3ByOw0K
Pj4gwqAgwqDCoMKgwqDCoCBkZXZfZGJnKHdkZC0+cGFyZW50LCAiJXNcbiIsIF9fZnVuY19fKTsN
Cj4+IMKgIEBAIC0xMDgsMTkgKzEyMyw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfaXdkZ19zdGFydChz
dHJ1Y3QgDQo+PiB3YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4+IMKgwqDCoMKgwqAgLyogc2V0IHBy
ZXNjYWxlciAmIHJlbG9hZCByZWdpc3RlcnMgKi8NCj4+IMKgwqDCoMKgwqAgcmVnX3dyaXRlKHdk
dC0+cmVncywgSVdER19QUiwgaXdkZ19wcik7DQo+PiDCoMKgwqDCoMKgIHJlZ193cml0ZSh3ZHQt
PnJlZ3MsIElXREdfUkxSLCBpd2RnX3Jscik7DQo+PiAtwqDCoMKgIHJlZ193cml0ZSh3ZHQtPnJl
Z3MsIElXREdfS1IsIEtSX0tFWV9FTkFCTEUpOw0KPj4gLQ0KPj4gLcKgwqDCoCAvKiB3YWl0IGZv
ciB0aGUgcmVnaXN0ZXJzIHRvIGJlIHVwZGF0ZWQgKG1heCAxMDBtcykgKi8NCj4+IC3CoMKgwqAg
cmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQod2R0LT5yZWdzICsgSVdER19TUiwgaXdk
Z19zciwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICEoaXdk
Z19zciAmIChTUl9QVlUgfCBTUl9SVlUpKSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNMRUVQX1VTLCBUSU1FT1VUX1VTKTsNCj4+IC3CoMKgwqAgaWYgKHJl
dCkgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIod2RkLT5wYXJlbnQsICJGYWlsIHRvIHNl
dCBwcmVzY2FsZXIsIHJlbG9hZCByZWdzXG4iKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Ow0KPj4gLcKgwqDCoCB9DQo+PiAtDQo+PiAtwqDCoMKgIC8qIHJlbG9hZCB3YXRjaGRvZyAq
Lw0KPj4gLcKgwqDCoCByZWdfd3JpdGUod2R0LT5yZWdzLCBJV0RHX0tSLCBLUl9LRVlfUkVMT0FE
KTsNCj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+PiBAQCAtMTMxLDYgKzEz
Myw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfaXdkZ19waW5nKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2Ug
DQo+PiAqd2RkKQ0KPj4gwqAgwqDCoMKgwqDCoCBkZXZfZGJnKHdkZC0+cGFyZW50LCAiJXNcbiIs
IF9fZnVuY19fKTsNCj4+IMKgICvCoMKgwqAgLyrCoCBTdGFydCB0aGUgd2F0Y2hkb2cgKi8NCj4+
ICvCoMKgwqAgcmVnX3dyaXRlKHdkdC0+cmVncywgSVdER19LUiwgS1JfS0VZX0VOQUJMRSk7DQo+
PiArDQo+PiDCoMKgwqDCoMKgIC8qIHJlbG9hZCB3YXRjaGRvZyAqLw0KPj4gwqDCoMKgwqDCoCBy
ZWdfd3JpdGUod2R0LT5yZWdzLCBJV0RHX0tSLCBLUl9LRVlfUkVMT0FEKTsNCj4+IMKgIEBAIC0x
NDAsMTIgKzE0NSwyMSBAQCBzdGF0aWMgaW50IHN0bTMyX2l3ZGdfcGluZyhzdHJ1Y3QgDQo+PiB3
YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4+IMKgIHN0YXRpYyBpbnQgc3RtMzJfaXdkZ19zZXRfdGlt
ZW91dChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdGltZW91dCkNCj4+IMKgIHsNCj4+ICvC
oMKgwqAgaW50IHJldDsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgZGV2X2RiZyh3ZGQtPnBhcmVudCwg
IiVzIHRpbWVvdXQ6ICVkIHNlY1xuIiwgX19mdW5jX18sIHRpbWVvdXQpOw0KPj4gwqAgwqDCoMKg
wqDCoCB3ZGQtPnRpbWVvdXQgPSB0aW1lb3V0Ow0KPj4gwqAgLcKgwqDCoCBpZiAod2F0Y2hkb2df
YWN0aXZlKHdkZCkpDQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN0bTMyX2l3ZGdfc3RhcnQo
d2RkKTsNCj4+ICvCoMKgwqAgaWYgKHdhdGNoZG9nX2FjdGl2ZSh3ZGQpKSB7DQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0ID0gc3RtMzJfaXdkZ19zZXRwcmVzY2FsZXIod2RkKTsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAocmV0KSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKHdk
ZC0+cGFyZW50LCAiZmFpbGVkIHRvIHNldCBwcmVzY2FsZXJcbiIpOw0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN0bTMyX2l3ZGdfc3RhcnQod2RkKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgIH0NCj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJu
IDA7DQo+PiDCoCB9DQo+PiBAQCAtMjYyLDEyICsyNzYsMjEgQEAgc3RhdGljIGludCBzdG0zMl9p
d2RnX3Byb2JlKHN0cnVjdCANCj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+IMKgwqDCoMKg
wqAgd2F0Y2hkb2dfc2V0X25vd2F5b3V0KHdkZCwgV0FUQ0hET0dfTk9XQVlPVVQpOw0KPj4gwqDC
oMKgwqDCoCB3YXRjaGRvZ19pbml0X3RpbWVvdXQod2RkLCAwLCBkZXYpOw0KPj4gwqAgK8KgwqDC
oCAvKiBNYWtlIHN1cmUgdGhlIHdhdGNoZG9nIGlzIHNlcnZpY2VkICovDQo+PiArwqDCoMKgIHNl
dF9iaXQoV0RPR19IV19SVU5OSU5HLCAmd2RkLT5zdGF0dXMpOw0KPj4gKw0KPj4gwqDCoMKgwqDC
oCByZXQgPSBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZShkZXYsIHdkZCk7DQo+PiDCoMKg
wqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+IMKg
IMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgd2R0KTsNCj4+IMKgICvCoMKg
wqAgcmV0ID0gc3RtMzJfaXdkZ19zZXRwcmVzY2FsZXIod2RkKTsNCj4+ICvCoMKgwqAgaWYgKHJl
dCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHNldCBwcmVz
Y2FsZXJcbiIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+PiArwqDCoMKgIH0N
Cj4+ICsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+Pg0KPg==
