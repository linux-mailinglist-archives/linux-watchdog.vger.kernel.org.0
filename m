Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B499829EC8D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 14:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJ2NO4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 09:14:56 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:12512 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgJ2NO4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 09:14:56 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TD77F1006830;
        Thu, 29 Oct 2020 14:14:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JsDOWpR7wWmDNPzt85sNwITIQxo1oDra/8kUlJSsU7c=;
 b=CD1WEShP9kEccfRc2xX7j1t8+AMXzCmDKxmQy0AHCTUb7LweQUDM7vYrmswOG1UnJrZK
 BBy53opospi33hxUTTcjrSUWTD8IF9R1Rroc9GBG7JiwXGlYL+zHMptYQPwMEhlXZqkt
 v5J5iy5fDAO3oQl+3ltOof8r1Hew8Sgjlo3M+MaEzWwCmkvqIWzt218T1ROjAzzleUbL
 f7joB9bGZUS42vgA3Yg8NXZv4EKu/Go40tezcke9OQ3nfkuGsmlEPqSTOXy8xjgEwLd7
 fqKHMIic4x9Xhqfg9DCRmuLYrcy40eHqkXc2ayZSs9po+iEPerXueeyuM8N6cCuHTAUQ hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccj28b0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 14:14:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FE9910002A;
        Thu, 29 Oct 2020 14:14:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BC342B8A0A;
        Thu, 29 Oct 2020 14:14:37 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 14:13:40 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 29 Oct 2020 14:13:40 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     "moderated list:ARM/STI ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Thread-Index: AQHWrcioFNV8nEJJDUWW2CVWTCiEIqmuJjyAgABYDoA=
Date:   Thu, 29 Oct 2020 13:13:40 +0000
Message-ID: <351407f1-e2c1-4f86-81be-0c26e60b3fd3@st.com>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
 <20201029075327.228570-2-coiby.xu@gmail.com>
 <23c07a77-2ce3-1ebd-c8d7-001cd896f157@st.com>
In-Reply-To: <23c07a77-2ce3-1ebd-c8d7-001cd896f157@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF9F32F768011A44A5D1141127756B1A@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_06:2020-10-29,2020-10-29 signatures=0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgQ29pYnkNCg0KQXMgYWxyZWFkeSBwb2ludGVkIGJ5IEZhYnJpY2UgR2FzbmllciBmb3Igc2lt
aWxhciBwYXRjaCAiW1BBVENIIDEwLzE1XSBpaW86IGFkYzogc3RtMzI6IHJlbW92ZSB1bm5lY2Vz
c2FyeSBDT05GSUdfUE1fU0xFRVAiDQoNCldoZW4gY29tcGlsaW5nIHdpdGggVz0xIGFuZCBDT05G
SUdfUE1fU0xFRVAgZGlzYWJsZWQsIHdlIGdvdCB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOg0KDQpk
cml2ZXJzL3dhdGNoZG9nL3N0X2xwY193ZHQuYzoyNjU6MTI6IHdhcm5pbmc6IOKAmHN0X3dkb2df
cmVzdW1l4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0NCsKgIDI2
NSB8IHN0YXRpYyBpbnQgc3Rfd2RvZ19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KwqDCoMKg
wqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fg0KZHJpdmVycy93YXRj
aGRvZy9zdF9scGNfd2R0LmM6MjUxOjEyOiB3YXJuaW5nOiDigJhzdF93ZG9nX3N1c3BlbmTigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0KwqAgMjUxIHwgc3RhdGlj
IGludCBzdF93ZG9nX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn4NCg0KQ2FuIHlvdSBhZGQgbWlzc2lu
ZyAiX19tYXliZSB1bnVzZWQiwqAgYXR0cmlidXRlID8NCg0KVGhhbmtzDQoNClBhdHJpY2UNCg0K
T24gMTAvMjkvMjAgODo1OCBBTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOg0KPiBIaSBDb2lieQ0K
Pg0KPiBPbiAxMC8yOS8yMCA4OjUzIEFNLCBDb2lieSBYdSB3cm90ZToNCj4+IFNJTVBMRV9ERVZf
UE1fT1BTIGhhcyBhbHJlYWR5IHRvb2sgZ29vZCBjYXJlIG9mIENPTkZJR19QTV9DT05GSUcuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29pYnkgWHUgPGNvaWJ5Lnh1QGdtYWlsLmNvbT4NCj4+IC0t
LQ0KPj4gIGRyaXZlcnMvd2F0Y2hkb2cvc3RfbHBjX3dkdC5jIHwgMiAtLQ0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNo
ZG9nL3N0X2xwY193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RfbHBjX3dkdC5jDQo+PiBpbmRl
eCAxNGFiNjU1OWM3NDguLmMxNDI4ZDYzZGM5ZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvd2F0
Y2hkb2cvc3RfbHBjX3dkdC5jDQo+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3N0X2xwY193ZHQu
Yw0KPj4gQEAgLTI0OCw3ICsyNDgsNiBAQCBzdGF0aWMgaW50IHN0X3dkb2dfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgCXJldHVybiAwOw0KPj4gIH0NCj4+ICANCj4+
IC0jaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+PiAgc3RhdGljIGludCBzdF93ZG9nX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQ0KPj4gIHsNCj4+ICAJc3RydWN0IHN0X3dkb2cgKnN0X3dkb2cg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSgmc3Rfd2RvZ19kZXYpOw0KPj4gQEAgLTI4NSw3ICsyODQs
NiBAQCBzdGF0aWMgaW50IHN0X3dkb2dfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICAN
Cj4+ICAJcmV0dXJuIDA7DQo+PiAgfQ0KPj4gLSNlbmRpZg0KPj4gIA0KPj4gIHN0YXRpYyBTSU1Q
TEVfREVWX1BNX09QUyhzdF93ZG9nX3BtX29wcywNCj4+ICAJCQkgc3Rfd2RvZ19zdXNwZW5kLA0K
PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0K
Pg0KPiBUaGFua3MNCj4NCj4gUGF0cmljZQ0KPg==
