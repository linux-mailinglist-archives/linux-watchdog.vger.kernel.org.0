Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919F43B5D7C
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jun 2021 14:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhF1MDi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 08:03:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58531 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232608AbhF1MDi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 08:03:38 -0400
X-UUID: cd97d7ea107e435f832f6231cf181a40-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=glrhrzaIhE7vhNz3vuSdEIfHQkSaoPCRC4KtXtyz+5E=;
        b=SRQCeNphtjYkTbA9alHnMjs3fZPik3jmTkHA3AZXUqaJkPJozGoW5KYp5sky2/NbjW61lesgSjTyV7p/VMYoCP6cJhjzI9Tsa4vwmmD/QueUGMrDZqbOm/t8FcX4F+ZcTEb8FWwE1nTzH1kvU2u81DT00PZwyQ7yy3eu9WC0LPA=;
X-UUID: cd97d7ea107e435f832f6231cf181a40-20210628
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1307190865; Mon, 28 Jun 2021 20:01:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 20:01:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 20:01:07 +0800
Message-ID: <1624881667.26480.2.camel@mhfsdcap03>
Subject: Re: [v4,3/3] watchdog: mediatek: mt8195: add wdt support
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>
Date:   Mon, 28 Jun 2021 20:01:07 +0800
In-Reply-To: <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
References: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
         <20210623123854.21941-4-Christine.Zhu@mediatek.com>
         <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gRnJpLCAyMDIxLTA2LTI1IGF0IDEzOjExICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0K
PiBPbiBXZWQsIEp1biAyMywgMjAyMSBhdCA4OjQ0IFBNIENocmlzdGluZSBaaHUNCj4gPENocmlz
dGluZS5aaHVAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiBGcm9tOiAiQ2hyaXN0aW5lIFpodSIg
PENocmlzdGluZS5aaHVAbWVkaWF0ZWsuY29tPg0KPiA+DQo+ID4gU3VwcG9ydCBNVDgxOTUgd2F0
Y2hkb2cgZGV2aWNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogY2hyaXN0aW5lLnpodSA8Q2hy
aXN0aW5lLlpodUBtZWRpYXRlay5jb20+DQo+IFN0aWxsIG1pc3NlZCB0aGlzIHBhcnQgcGVyIHN1
Z2dlc3Rpb24gaW4gWzFdLg0KPiANCj4gWzFdOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA2MjMwOTI5MTcuNDQ0Ny0yLUNocmlz
dGluZS5aaHVAbWVkaWF0ZWsuY29tLyMyNDI3MDYxOQ0KDQpUaHggZm9yIHlvdXIgYWR2aWNlLEkg
aGF2ZSB1cGxvYWRlZCB2NSB0byBmaXggaXQuDQo=

