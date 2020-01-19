Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FBE141B94
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jan 2020 04:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgASDWX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 Jan 2020 22:22:23 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:22750 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725497AbgASDWX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 Jan 2020 22:22:23 -0500
X-UUID: 69125e9aa54e446c9366f7f201a9d17a-20200119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=N4m9R+HOEDebYFK3h+Sc6tDJ4qpxShm9ZEefTev3gRc=;
        b=GDKHRbGqMIa1Fbjl67s5M9EaXA3KXyexPY5V6kV+EhVh/DmDufg6TvQ9JOTuZkUff0nCUoDogkrgVZ+P+8l5jpwmbkib/S3vKmK0dAFDf7ZOz/7PZJC0XPPZvG9F08PD46+C1EG0qyBpoIX9GgZbDJ8eYRgjfaPqDtQyYEWqqSw=;
X-UUID: 69125e9aa54e446c9366f7f201a9d17a-20200119
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1301561568; Sun, 19 Jan 2020 11:22:02 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sun, 19 Jan
 2020 11:20:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 Jan 2020 11:22:07 +0800
Message-ID: <1579404112.27500.0.camel@mhfsdcap03>
Subject: Re: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
From:   Yong Liang <yong.liang@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chang-An Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B6=E5=AE=89=29?= 
        <Chang-An.Chen@mediatek.com>,
        Freddy Hsin =?UTF-8?Q?=28=E8=BE=9B=E6=81=92=E8=B1=90=29?= 
        <Freddy.Hsin@mediatek.com>,
        Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?= 
        <Jiaxin.Yu@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
        Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= 
        <Yingjoe.Chen@mediatek.com>
Date:   Sun, 19 Jan 2020 11:21:52 +0800
In-Reply-To: <987a7ccf-3d1b-9d4b-d766-63925268c21e@gmail.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
         <20200115085828.27791-5-yong.liang@mediatek.com>
         <987a7ccf-3d1b-9d4b-d766-63925268c21e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0375DB0187E35C7A60A71975C79E48344130A27F5AE250EF19AE1BE1763111EC2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDAwOjE4ICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTUvMDEvMjAyMCAwOTo1OCwgWW9uZyBMaWFuZyB3cm90ZToNCj4gPiBGcm9t
OiAieW9uZy5saWFuZyIgPHlvbmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IEFkZCBy
ZXNldCBjb250cm9sbGVyIGZvciAyNzEyLg0KPiA+IEJlc2lkZXMgd2F0Y2hkb2csIE1USyB0b3By
Z3UgbW9kdWxlIGFsc2EgcHJvdmlkZSBzdWItc3lzdGVtIChlZywgYXVkaW8sDQo+ID4gY2FtZXJh
LCBjb2RlYyBhbmQgY29ubmVjdGl2aXR5KSBzb2Z0d2FyZSByZXNldCBmdW5jdGlvbmFsaXR5Lg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IHlvbmcubGlhbmcgPHlvbmcubGlhbmdAbWVkaWF0ZWsu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogWWluZ2pvZSBDaGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsu
Y29tPg0KPiA+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPg0KPiANCj4gQWNrZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+DQoNCkhpIE1hdHRpYXM6DQogIE1heSBJIG5lZWQgc2VuZCBhIG5ldyBwYXRjaCB3aGl0
aCB0aGlzIHRhZz8NCj4gDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5j
IHwgNiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jDQo+ID4gaW5kZXggZTg4YWFjYjA0MDRkLi5kNmE2MzkzZjYwOWQgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCj4gPiArKysgYi9kcml2
ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KPiA+IEBAIC05LDYgKzksNyBAQA0KPiA+ICAgKiBCYXNl
ZCBvbiBzdW54aV93ZHQuYw0KPiA+ICAgKi8NCj4gPiAgDQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaD4NCj4gPiAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+IEBAIC02
Nyw2ICs2OCwxMCBAQCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIHsNCj4gPiAgCWludCB0b3ByZ3Vfc3df
cnN0X251bTsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dk
dF9kYXRhIG10MjcxMl9kYXRhID0gew0KPiA+ICsJLnRvcHJndV9zd19yc3RfbnVtID0gTVQyNzEy
X1RPUFJHVV9TV19SU1RfTlVNLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfd2R0X2RhdGEgbXQ4MTgzX2RhdGEgPSB7DQo+ID4gIAkudG9wcmd1X3N3X3JzdF9u
dW0gPSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0sDQo+ID4gIH07DQo+ID4gQEAgLTMxNCw2ICsz
MTksNyBAQCBzdGF0aWMgaW50IG10a193ZHRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4g
PiAgI2VuZGlmDQo+ID4gIA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBt
dGtfd2R0X2R0X2lkc1tdID0gew0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3
MTItd2R0IiwgLmRhdGEgPSAmbXQyNzEyX2RhdGEgfSwNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ2NTg5LXdkdCIgfSwNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTgzLXdkdCIsIC5kYXRhID0gJm10ODE4M19kYXRhIH0sDQo+ID4gIAl7IC8qIHNlbnRpbmVs
ICovIH0NCj4gPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0K

