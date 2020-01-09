Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9883E13511A
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Jan 2020 02:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAIB6Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 20:58:16 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:16731 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726913AbgAIB6Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 20:58:16 -0500
X-UUID: 9e09695191a449c9bd47d1364bb50fe4-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=f8V/w28keayMesUZndCtYcFhLlpst9SQecLMZIoZ2Ow=;
        b=jcIaSPWVnZTrfouW4dPUXFy601FrkzqHDA0qFmcRZI1Ll83ivQNN2ulQpOBUIApIHpKMICRTUByw0V48GLWfUg/PqWZoU9+a3sofFBQkl7peWEDNjs0evgk9zUFALobP3Gbtp4SfsZHU0E8OkI9k5VN74q6Tkr5S145s1/PPUw0=;
X-UUID: 9e09695191a449c9bd47d1364bb50fe4-20200109
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1914033652; Thu, 09 Jan 2020 09:58:05 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 9 Jan
 2020 09:56:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 09:58:22 +0800
Message-ID: <1578535081.20923.5.camel@mhfsdcap03>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
From:   Yong Liang <yong.liang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?= 
        <Jiaxin.Yu@mediatek.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
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
        Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= 
        <Yingjoe.Chen@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>
Date:   Thu, 9 Jan 2020 09:58:01 +0800
In-Reply-To: <20200106215721.GB31059@bogus>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
         <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
         <20200106215721.GB31059@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C4E159BAC36ECB497154526A379FBD41D7CD188C7E791C104A8D9215220B2C4D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVHVlLCAyMDIwLTAxLTA3IGF0IDA1OjU3ICswODAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gTW9uLCA2IEphbiAyMDIwIDExOjExOjM1ICswODAwLCBKaWF4aW4gWXUgd3JvdGU6DQo+ID4g
QWRkICNyZXNldC1jZWxscyBwcm9wZXJ0eSBhbmQgdXBkYXRlIGV4YW1wbGUNCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiB5b25nLmxpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKaWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IFlpbmdqb2UgQ2hlbiA8eWluZ2pvZS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgIHwg
MTAgKysrKysrLS0tDQo+ID4gIC4uLi9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaCAg
ICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysNCj4gPiAgLi4uL3Jlc2V0LWNvbnRyb2xs
ZXIvbXQ4MTgzLXJlc2V0cy5oICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysNCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210Mjcx
Mi1yZXNldHMuaA0KPiA+IA0KPiANCj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieSB0
YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMuIEhvd2V2ZXIsDQo+IHRoZXJlJ3Mgbm8gbmVl
ZCB0byByZXBvc3QgcGF0Y2hlcyAqb25seSogdG8gYWRkIHRoZSB0YWdzLiBUaGUgdXBzdHJlYW0N
Cj4gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNp
b24gdGhleSBhcHBseS4NCj4gDQo+IElmIGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwg
cGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFuZ2VkLg0KDQogIFNvcnJ5IG5vdCBhZGQgeW91
IGluIFJldmlld2VkLWJ5Og0KICBXZSB3aWxsIGFkZCB5b3UgaW4gUmV2aWV3ZWQtYnk6IGlmIGhh
dmUgbmV4dCBwYXRjaC4NCg==

