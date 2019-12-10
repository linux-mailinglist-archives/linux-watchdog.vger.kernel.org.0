Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB189118238
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2019 09:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfLJI3N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Dec 2019 03:29:13 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:43428 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbfLJI3N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Dec 2019 03:29:13 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBA8MgQl024210;
        Tue, 10 Dec 2019 09:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/u1hvBc/HdsmzCgZdcSYSRr+5Y+aodFwrfclzaWfZsI=;
 b=AhGBYNHhQYTnV+NaByM56zLy55DD5vzpdVmeK6SeNXYaqcSU4cUeVgkFkdmhwquQ7myr
 MFRSo/RY+5/x5YZ3dF+ZyRLkhOvOSAZ6K/XgL5ayKTEx+hqu/Zl0CieQRkMAWQiod90O
 aAcvuK7emhbvGQzCbJ5IZI5Jw9yOkIkP2Jyi7K2q3FZBH5KlCCXdEcOE/zALMiUep5+a
 U0Pes8LzlK+mvlq9oMUWuvdjva8MQzlkRN23BLVTklyjAKBEoygHi2swNjW63ppMj7oH
 BxQ7NYstafAdGJ6hTQ+CL6wPGQgNHjOKUzK5qirIYPIsDR5X+eqw6hzUOq0IyHyz9A3g cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wraq3ugh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Dec 2019 09:28:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7DD010002A;
        Tue, 10 Dec 2019 09:28:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE8E221E551;
        Tue, 10 Dec 2019 09:28:20 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Dec
 2019 09:28:20 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 10 Dec 2019 09:28:20 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: watchdog: Convert stm32 watchdog bindings
 to json-schema
Thread-Topic: [PATCH v3] dt-bindings: watchdog: Convert stm32 watchdog
 bindings to json-schema
Thread-Index: AQHVoR3g+vJ/hd4xOEqFJoxHHFujBqezFI8A
Date:   Tue, 10 Dec 2019 08:28:20 +0000
Message-ID: <bc07ec1b-12b5-3079-1a96-44a2906a1da2@st.com>
References: <20191122101616.14351-1-benjamin.gaignard@st.com>
In-Reply-To: <20191122101616.14351-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <81F1C2245203984B9F87BD5F5A90CDAE@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiAxMS8yMi8xOSAxMToxNiBBTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+IENvbnZl
cnQgdGhlIFNUTTMyIHdhdGNoZG9nIGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBq
c29uLXNjaGVtYQ0KDQpnZW50bGUgcGluZyB0byByZXZpZXdlcnMsDQoNClRoYW5rcywNCg0KQmVu
amFtaW4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAc3QuY29tPg0KPiAtLS0NCj4gY2hhbmdlcyBpbiB2ZXJzaW9uIDM6DQo+IC0gZml4IHR5
cG8gaW4gY2xvY2stbmFtZXMgZW51bQ0KPiAgICANCj4gY2hhbmdlcyBpbiB2ZXJzaW9uIDI6DQo+
IC0gcmVtb3ZlIHRyYWlsZXIgc3BhY2UNCj4gLSBhZGQgQ2hyaXN0b3BoZSBpbiB0aGUgbWFpbnRh
aW5lcnMgbGlzdA0KPg0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N0LHN0
bTMyLWl3ZGcudHh0IHwgMjYgLS0tLS0tLS0tLQ0KPiAgIC4uLi9iaW5kaW5ncy93YXRjaGRvZy9z
dCxzdG0zMi1pd2RnLnlhbWwgICAgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93
YXRjaGRvZy9zdCxzdG0zMi1pd2RnLnR4dA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy55YW1sDQo+
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hk
b2cvc3Qsc3RtMzItaXdkZy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
d2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy50eHQNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IGQ4ZjQ0MzBiMGExMy4uMDAwMDAwMDAwMDAwDQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9zdCxzdG0zMi1pd2RnLnR4dA0KPiArKysgL2Rl
di9udWxsDQo+IEBAIC0xLDI2ICswLDAgQEANCj4gLVNUTTMyIEluZGVwZW5kZW50IFdhdGNoRG9H
IChJV0RHKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gLVJl
cXVpcmVkIHByb3BlcnRpZXM6DQo+IC0tIGNvbXBhdGlibGU6IFNob3VsZCBiZSBlaXRoZXI6DQo+
IC0gIC0gInN0LHN0bTMyLWl3ZGciDQo+IC0gIC0gInN0LHN0bTMybXAxLWl3ZGciDQo+IC0tIHJl
ZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVycyBzZXQg
Zm9yIHRoZSBkZXZpY2UNCj4gLS0gY2xvY2tzOiBSZWZlcmVuY2UgdG8gdGhlIGNsb2NrIGVudHJ5
IGxzaS4gQWRkaXRpb25hbCBwY2xrIGNsb2NrIGVudHJ5DQo+IC0gIGlzIHJlcXVpcmVkIG9ubHkg
Zm9yIHN0LHN0bTMybXAxLWl3ZGcuDQo+IC0tIGNsb2NrLW5hbWVzOiBOYW1lIG9mIHRoZSBjbG9j
a3MgdXNlZC4NCj4gLSAgImxzaSIgZm9yIHN0LHN0bTMyLWl3ZGcNCj4gLSAgImxzaSIsICJwY2xr
IiBmb3Igc3Qsc3RtMzJtcDEtaXdkZw0KPiAtDQo+IC1PcHRpb25hbCBQcm9wZXJ0aWVzOg0KPiAt
LSB0aW1lb3V0LXNlYzogV2F0Y2hkb2cgdGltZW91dCB2YWx1ZSBpbiBzZWNvbmRzLg0KPiAtDQo+
IC1FeGFtcGxlOg0KPiAtDQo+IC1pd2RnOiB3YXRjaGRvZ0A0MDAwMzAwMCB7DQo+IC0JY29tcGF0
aWJsZSA9ICJzdCxzdG0zMi1pd2RnIjsNCj4gLQlyZWcgPSA8MHg0MDAwMzAwMCAweDQwMD47DQo+
IC0JY2xvY2tzID0gPCZjbGtfbHNpPjsNCj4gLQljbG9jay1uYW1lcyA9ICJsc2kiOw0KPiAtCXRp
bWVvdXQtc2VjID0gPDMyPjsNCj4gLX07DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Qsc3RtMzItaXdkZy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N0LHN0bTMyLWl3ZGcueWFtbA0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjkyODU4ODA5MTcxMA0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy93YXRjaGRvZy9zdCxzdG0zMi1pd2RnLnlhbWwNCj4gQEAgLTAsMCArMSw1NSBAQA0KPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+
ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy93YXRjaGRvZy9zdCxzdG0zMi1pd2RnLnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gKw0KPiArdGl0bGU6IFNUTWljcm9l
bGVjdHJvbmljcyBTVE0zMiBJbmRlcGVuZGVudCBXYXRjaERvRyAoSVdERykgYmluZGluZ3MNCj4g
Kw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJl
QHN0LmNvbT4NCj4gKyAgLSBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVy
QHN0LmNvbT4NCj4gKw0KPiArYWxsT2Y6DQo+ICsgIC0gJHJlZjogIndhdGNoZG9nLnlhbWwjIg0K
PiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGVudW06DQo+ICsg
ICAgICAtIHN0LHN0bTMyLWl3ZGcNCj4gKyAgICAgIC0gc3Qsc3RtMzJtcDEtaXdkZw0KPiArDQo+
ICsgIHJlZzoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIGNsb2NrczoNCj4gKyAgICBp
dGVtczoNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IExvdyBzcGVlZCBjbG9jaw0KPiArICAgICAg
LSBkZXNjcmlwdGlvbjogT3B0aW9uYWwgcGVyaXBoZXJhbCBjbG9jaw0KPiArICAgIG1pbkl0ZW1z
OiAxDQo+ICsgICAgbWF4SXRlbXM6IDINCj4gKw0KPiArICBjbG9jay1uYW1lczoNCj4gKyAgICBp
dGVtczoNCj4gKyAgICAgIGVudW06IFsgbHNpLCBwY2xrIF0NCj4gKyAgICBtaW5JdGVtczogMQ0K
PiArICAgIG1heEl0ZW1zOiAyDQo+ICsNCj4gK3JlcXVpcmVkOg0KPiArICAtIGNvbXBhdGlibGUN
Cj4gKyAgLSByZWcNCj4gKyAgLSBjbG9ja3MNCj4gKyAgLSBjbG9jay1uYW1lcw0KPiArDQo+ICtl
eGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0
bTMybXAxLWNsa3MuaD4NCj4gKyAgICB3YXRjaGRvZ0A1YTAwMjAwMCB7DQo+ICsgICAgICBjb21w
YXRpYmxlID0gInN0LHN0bTMybXAxLWl3ZGciOw0KPiArICAgICAgcmVnID0gPDB4NWEwMDIwMDAg
MHg0MDA+Ow0KPiArICAgICAgY2xvY2tzID0gPCZyY2MgSVdERzI+LCA8JnJjYyBDS19MU0k+Ow0K
PiArICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIsICJsc2kiOw0KPiArICAgICAgdGltZW91dC1z
ZWMgPSA8MzI+Ow0KPiArICAgIH07DQo+ICsNCj4gKy4uLg==
