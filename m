Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2DB2B43B7
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Nov 2020 13:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbgKPM1T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Nov 2020 07:27:19 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:41873 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728835AbgKPM1T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Nov 2020 07:27:19 -0500
X-UUID: 4a37f8205f2b46ab8b2151b28eccb133-20201116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=syQ+udVPv5T4CZsRsJsAvtDXozry+wZ/L2ZNpQPdplU=;
        b=Lwy7VfzVpIOg5v0cB93yWRX1IebJ++V3sVQNBH8VYwOSGMFm7aU9l2FSL+rBP1QgBZLU31Eyt+FILRm2tY6ey0aOlKhoNr1wL8tP2HrpKUYJkgDSKgQjpbU+MZHlpRMC/BczNMz1o9xYkABBj5Qhwo+kRm9ohHwjfvIz6jXRZVo=;
X-UUID: 4a37f8205f2b46ab8b2151b28eccb133-20201116
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1699799724; Mon, 16 Nov 2020 20:27:14 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Nov
 2020 20:27:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Nov 2020 20:27:10 +0800
Message-ID: <1605529631.14806.57.camel@mhfsdcap03>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>
Date:   Mon, 16 Nov 2020 20:27:11 +0800
In-Reply-To: <20201014131936.20584-3-crystal.guo@mediatek.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
         <20201014131936.20584-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgTWFpbnRhaW5lcnMsDQoNCkdlbnRsZSBwaW4gZm9yIHRoaXMgcGF0Y2guDQoNClRoYW5rcw0K
DQpPbiBXZWQsIDIwMjAtMTAtMTQgYXQgMjE6MTkgKzA4MDAsIENyeXN0YWwgR3VvIHdyb3RlOg0K
PiB1cGRhdGUgbXRrLXdkdCBkb2N1bWVudCBmb3IgTVQ4MTkyIHBsYXRmb3JtDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4
dCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQu
dHh0DQo+IGluZGV4IDQ1ZWVkYzJjMzE0MS4uZTM2YmE2MGRlODI5IDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQu
dHh0DQo+IEBAIC0xMiw2ICsxMiw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ICAJIm1lZGlh
dGVrLG10NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjkNCj4gIAki
bWVkaWF0ZWssbXQ4MTgzLXdkdCI6IGZvciBNVDgxODMNCj4gIAkibWVkaWF0ZWssbXQ4NTE2LXdk
dCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UODUxNg0KPiArCSJtZWRpYXRlayxtdDgx
OTItd2R0IjogZm9yIE1UODE5Mg0KPiAgDQo+ICAtIHJlZyA6IFNwZWNpZmllcyBiYXNlIHBoeXNp
Y2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIHJlZ2lzdGVycy4NCj4gIA0KDQo=

