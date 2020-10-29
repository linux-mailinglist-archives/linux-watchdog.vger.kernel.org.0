Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9243029E5D4
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 09:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgJ2H64 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 03:58:56 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:24564 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727442AbgJ2H6z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 03:58:55 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09T7vAWa013935;
        Thu, 29 Oct 2020 08:58:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=XV/PGflp4CJVwMij+k8693KpWraYm+Qoc900pW4/PaI=;
 b=NZrMALknbTwyhNicvs1u9rf0kVJIZtr2TVhVQKgt+ARzAT40WxunZ1er/GkJsvltZszC
 tH14XisGANnIE6YurU17mavzCx0nFZXcaxSWnSbUS2Pz343Y+xoTfB0KP1B/xTtn/A4Z
 d5VxfXZugwJTpuQzKXiV3PZamQq7MfxFaJz4jqn9jq7G+amfpPM0PM4dAkkDpEUOA7Go
 CZhFklvdj0zU0VIR0Ji3v2WvYhXVh15P6JTrnuVEEZIng+7oE3J5VF/qS1NGLjlCF9WJ
 CNiD8W+IOS55kDlFLJCWWYae84+cJp7PwOP/G1j8n01fCDXiLgaHl8uOhN1ED2ohvBNx Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccj26gny-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 08:58:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2880B10002A;
        Thu, 29 Oct 2020 08:58:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18CA0230AD9;
        Thu, 29 Oct 2020 08:58:31 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 08:58:30 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 29 Oct 2020 08:58:30 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Coiby Xu <coiby.xu@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>
CC:     "moderated list:ARM/STI ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary
 CONFIG_PM_SLEEP
Thread-Index: AQHWrcioFNV8nEJJDUWW2CVWTCiEIqmuJjyA
Date:   Thu, 29 Oct 2020 07:58:30 +0000
Message-ID: <23c07a77-2ce3-1ebd-c8d7-001cd896f157@st.com>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
 <20201029075327.228570-2-coiby.xu@gmail.com>
In-Reply-To: <20201029075327.228570-2-coiby.xu@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9030CB49FBBA024DBA76FE5721EDE49E@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_03:2020-10-29,2020-10-29 signatures=0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgQ29pYnkNCg0KT24gMTAvMjkvMjAgODo1MyBBTSwgQ29pYnkgWHUgd3JvdGU6DQo+IFNJTVBM
RV9ERVZfUE1fT1BTIGhhcyBhbHJlYWR5IHRvb2sgZ29vZCBjYXJlIG9mIENPTkZJR19QTV9DT05G
SUcuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENvaWJ5IFh1IDxjb2lieS54dUBnbWFpbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy93YXRjaGRvZy9zdF9scGNfd2R0LmMgfCAyIC0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hk
b2cvc3RfbHBjX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9zdF9scGNfd2R0LmMNCj4gaW5kZXgg
MTRhYjY1NTljNzQ4Li5jMTQyOGQ2M2RjOWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvc3RfbHBjX3dkdC5jDQo+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RfbHBjX3dkdC5jDQo+
IEBAIC0yNDgsNyArMjQ4LDYgQEAgc3RhdGljIGludCBzdF93ZG9nX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC0jaWZkZWYg
Q09ORklHX1BNX1NMRUVQDQo+ICBzdGF0aWMgaW50IHN0X3dkb2dfc3VzcGVuZChzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0IHN0X3dkb2cgKnN0X3dkb2cgPSB3YXRjaGRvZ19n
ZXRfZHJ2ZGF0YSgmc3Rfd2RvZ19kZXYpOw0KPiBAQCAtMjg1LDcgKzI4NCw2IEBAIHN0YXRpYyBp
bnQgc3Rfd2RvZ19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgDQo+ICAJcmV0dXJuIDA7
DQo+ICB9DQo+IC0jZW5kaWYNCj4gIA0KPiAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0X3dk
b2dfcG1fb3BzLA0KPiAgCQkJIHN0X3dkb2dfc3VzcGVuZCwNCg0KUmV2aWV3ZWQtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzDQoNClBhdHJpY2UN
Cg==
