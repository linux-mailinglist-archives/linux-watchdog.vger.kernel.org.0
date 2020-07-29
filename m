Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42438231AEA
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 10:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgG2IMW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 04:12:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:28274 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726476AbgG2IMW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 04:12:22 -0400
X-UUID: 2413338d715b4af9863f7465faf99924-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=H3idPQTUXz+EWlLU7Ek+7vnRUsZER+6TN+XpZ69MkBo=;
        b=Xq9chmJJZU4nKTZwiwj30gbXYzJ3eQxN7j8exLZ8FsmaopQ92ZYtk7B2k+dE2Hctx7YTqlYxR7uD5s50Rqj1EXo7ouerVxApd0jS/Mq1B0QJQ5D6pFZ2oIXLwOI0+mhiX+KkXRH6Q6lKl2YTKJ1oz/faHEVt0fPJOe538KAMRUY=;
X-UUID: 2413338d715b4af9863f7465faf99924-20200729
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1357280908; Wed, 29 Jul 2020 16:12:20 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 29 Jul
 2020 16:12:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:12:16 +0800
Message-ID: <1596010313.11360.2.camel@mhfsdcap03>
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>,
        Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= 
        <erin.lo@mediatek.com>
Date:   Wed, 29 Jul 2020 16:11:53 +0800
In-Reply-To: <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
         <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
         <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 49384A5751F6C3098C0961C234D96D309D10B032A745AB30AF2B8990DB3650B52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTI5IGF0IDE1OjQyICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiBIaSBDcnlzdGFsLA0KPiANCj4gT24gMjkvMDcvMjAyMCAwODozMCwgQ3J5c3RhbCBHdW8g
d3JvdGU6DQo+ID4gbWVyZ2UgYWxsIHRoZSByZXNldCBudW1iZXJzIGluIG9uZSBoZWFkIGZpbGUu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlh
dGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJv
bGxlci9tdGstcmVzZXRzLmggfCAxMyArKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRzLmgNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ay1yZXNldHMuaCBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRzLmgNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLmQ3M2E0YmENCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVy
L210ay1yZXNldHMuaA0KPiA+IEBAIC0wLDAgKzEsMTMgQEANCj4gPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDIwIE1lZGlhdGVrIEluYy4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVm
IF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01USw0KPiA+ICsjZGVmaW5lIF9EVF9CSU5E
SU5HU19SRVNFVF9DT05UUk9MTEVSX01USw0KPiA+ICsNCj4gPiArI2RlZmluZSBNVDI3MTJfVE9Q
UkdVX1NXX1JTVF9OVU0JMTENCj4gPiArI2RlZmluZSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0g
ICAgICAgIDE5DQo+IA0KPiBNYXliZSBJIGRpZG4ndCBleHBsYWluIG15c2VsZiBwcm9wZXJseS4g
V2Ugd2FudCB0byBoYXZlIGFsbCByZXNldHMgaW4gb25lIGZpbGUgDQo+IGFuZCBkbyBub3Qgd2Fu
dCB0byBoYXZlIHRoZSByZXNldHMgZm9yIHRoZSB3YXRjaGRvZyBpbiBhIGRpZmZlcmVudCBmaWxl
LiBUaGF0IA0KPiBtZWFucyBJIGRvbid0IHRoaW4geW91ciBwYXRjaCBpcyBjb3JyZWN0IGFuZCB0
aGUgZWZmb3J0IHNob3VsZCBiZSBhYmFuZG9uZWQuDQo+IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlh
cw0KDQpEbyB5b3UgbWVhbiB0byBrZWVwIHRoZSBjdXJyZW50IHdheSB1bmNoYW5nZWQ/IEZvciBl
eGFtcGxlLCB3aXRoIGEgbmV3DQpTT0MgODE5Miwgc2hvdWxkIGFkZCBhIG5ldyBoZWFkIGZpbGUg
bXQ4MTkyX3Jlc2V0cy5oIGZvciB0aGUgcmVzZXRzDQpudW1iZXJzLg0KDQo=

