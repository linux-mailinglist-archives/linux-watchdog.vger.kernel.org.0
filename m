Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46601072EE
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 14:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKVNPl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 08:15:41 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:40738 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726548AbfKVNPk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 08:15:40 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAMDC3Zm016600;
        Fri, 22 Nov 2019 14:15:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fsOHhYzNXWXB343toBErYF3JFgQsNuXPAR+dwnBzdGI=;
 b=0FAzw4EA1OF5EXTJYHgyEdlBJ+LLlYEYsIyl5Rpius2KHdsBDYFutFMljQDvgXJZSBcj
 WZ9BAnGc+kgpN9AZ/bPRixPvdI5VSary5czGFV3YJUMTE1Oonh02vPb8liPPJoWl0s+C
 xxymM2nU/9hGpRmrPFJlU3I/+ZnWslsGi0NGcF4q/gfT1qWlje1uLUzI83Wi8Cwn7DPN
 u8IhapLtXx2vJ96YYGv9YPRk9zEIuTiX55Zv9Yu5BDBh2a2uTYsaJBEo+ZptplgNeAJe
 Cjnkv8jKvex5+laaI3PUbz+6K3f0QgMrisiDLjZFyHlsozMOANwcjPsQKmPidJ3zP6qT Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wa9ujgx69-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Nov 2019 14:15:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E875110002A;
        Fri, 22 Nov 2019 14:15:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1A902BE244;
        Fri, 22 Nov 2019 14:15:07 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov
 2019 14:15:07 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Fri, 22 Nov 2019 14:15:07 +0100
From:   Christophe ROULLIER <christophe.roullier@st.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
Thread-Topic: [Linux-stm32] [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
Thread-Index: AQHVoQ5NhIxTjK/sUU24wk/cKk90B6eW7F6AgAAucQA=
Date:   Fri, 22 Nov 2019 13:15:07 +0000
Message-ID: <70c319bd-866c-5305-e535-ead663652c5f@st.com>
References: <20191122082442.21695-1-christophe.roullier@st.com>
 <ea80ec65-8621-453c-4d5b-af38d8afeb70@pengutronix.de>
In-Reply-To: <ea80ec65-8621-453c-4d5b-af38d8afeb70@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <199B8515659CB941A78B6E41A371D31C@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_02:2019-11-21,2019-11-22 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiAxMS8yMi8xOSAxMToyOCBBTSwgQWhtYWQgRmF0b3VtIHdyb3RlOg0KPiBIZWxsbyBDaHJp
c3RvcGhlLA0KPg0KPiBPbiAxMS8yMi8xOSA5OjI0IEFNLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdy
b3RlOg0KPj4gKwkvKg0KPj4gKwkgKiBJbiBjYXNlIG9mIENPTkZJR19XQVRDSERPR19IQU5ETEVf
Qk9PVF9FTkFCTEVEIGlzIHNldA0KPj4gKwkgKiAoTWVhbnMgVS1Cb290L2Jvb3Rsb2FkZXJzIGxl
YXZlcyB0aGUgd2F0Y2hkb2cgcnVubmluZykNCj4+ICsJICogV2hlbiB3ZSBnZXQgaGVyZSB3ZSBz
aG91bGQgbWFrZSBhIGRlY2lzaW9uIHRvIHByZXZlbnQNCj4+ICsJICogYW55IHNpZGUgZWZmZWN0
cyBiZWZvcmUgdXNlciBzcGFjZSBkYWVtb24gd2lsbCB0YWtlIGNhcmUgb2YgaXQuDQo+PiArCSAq
IFRoZSBiZXN0IG9wdGlvbiwgdGFraW5nIGludG8gY29uc2lkZXJhdGlvbiB0aGF0IHRoZXJlIGlz
IG5vDQo+PiArCSAqIHdheSB0byByZWFkIHZhbHVlcyBiYWNrIGZyb20gaGFyZHdhcmUsIGlzIHRv
IGVuZm9yY2Ugd2F0Y2hkb2cNCj4+ICsJICogYmVpbmcgcnVuIHdpdGggZGV0ZXJtaW5pc3RpYyB2
YWx1ZXMuDQo+IFdoYXQgYWJvdXQgdGhlICJPTkY6IFdhdGNoZG9nIGVuYWJsZSBzdGF0dXMgYml0
IiBpbiB0aGUgSVdER19TUiByZWdpc3Rlcj8NCj4NCj4gQ2hlZXJzDQo+IEFobWFkDQo+DQpIaSwN
Cg0KVGhhbmtzIEFobWFkIGZvciB5b3VyIGZlZWRiYWNrLCBpdCBpcyBhIG1pc3Rha2UgaW4gb3Vy
IHJlZiBtYW51YWwuIFRoaXMgDQpiaXQgaXMgbm90IHByZXNlbnQNCg0KaW4gb3VyIGl3ZGcgSVAs
IHdlIHdpbGwgdXBkYXRlIG91ciBkb2N1bWVudGF0aW9uIGFjY29yZGluZ2x5Lg0KDQpSZWdhcmRz
LA0KDQpDaHJpc3RvcGhlDQo=
