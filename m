Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790E3233041
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgG3KWj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:34215 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728972AbgG3KW2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:28 -0400
X-UUID: 9506b8dc5a2442229bffa56ed4d0c835-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=650NVCPZG1KcydX0hTrnKCdiU0nIw3CgigzQoQXdQQk=;
        b=AnCLwfNRoY0Za/crMZD+KmDbN9m1OhpBK3T4QnCwpTA+Fz6xaizLnA8+Bsri4uF3GYNldQEECciG96dspMNWxteHicn2/O+UikznD446kZTC1aOWaHhyo3cENUvchTpwDeFmYBPKVuUM/nCwDrGjO5z9AFNxZ07AcWHbZkKJLmY=;
X-UUID: 9506b8dc5a2442229bffa56ed4d0c835-20200730
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1624301822; Thu, 30 Jul 2020 18:22:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:19 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,4/5] dt-binding: mt8192: add toprgu reset-controller head file
Date:   Thu, 30 Jul 2020 18:21:49 +0800
Message-ID: <1596104510-11113-5-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

YWRkIHRvcHJndSByZXNldC1jb250cm9sbGVyIGhlYWQgZmlsZSBmb3IgTVQ4MTkyIHBsYXRmb3Jt
DQoNClNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+
DQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4N
Ci0tLQ0KIC4uLi9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaCAg
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29u
dHJvbGxlci9tdDgxOTItcmVzZXRzLmgNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
aW5kZXggMDAwMDAwMC4uODRmZWUzNA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KQEAgLTAsMCArMSwzMCBA
QA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5
cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KKyAqIEF1dGhvcjogWW9uZyBMaWFuZyA8eW9u
Zy5saWFuZ0BtZWRpYXRlay5jb20+DQorICovDQorDQorI2lmbmRlZiBfRFRfQklORElOR1NfUkVT
RVRfQ09OVFJPTExFUl9NVDgxOTINCisjZGVmaW5lIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9M
TEVSX01UODE5Mg0KKw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9NTV9TV19SU1QJCQkJCTENCisj
ZGVmaW5lIE1UODE4M19UT1BSR1VfTUZHX1NXX1JTVAkJCQkyDQorI2RlZmluZSBNVDgxODNfVE9Q
UkdVX1ZFTkNfU1dfUlNUCQkJCTMNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfVkRFQ19TV19SU1QJ
CQkJNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JTUdfU1dfUlNUCQkJCTUNCisjZGVmaW5lIE1U
ODE4M19UT1BSR1VfTURfU1dfUlNUCQkJCQk3DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0NPTk5f
U1dfUlNUCQkJCTkNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ09OTl9NQ1VfU1dfUlNUCQkJMTIN
CisjZGVmaW5lIE1UODE4M19UT1BSR1VfSVBVMF9TV19SU1QJCQkJMTQNCisjZGVmaW5lIE1UODE4
M19UT1BSR1VfSVBVMV9TV19SU1QJCQkJMTUNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQVVESU9f
U1dfUlNUCQkJCTE3DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0NBTVNZU19TV19SU1QJCQkJMTgN
CisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfTUpDX1NXX1JTVAkJCQkxOQ0KKyNkZWZpbmUgTVQ4MTky
X1RPUFJHVV9DMktfUzJfU1dfUlNUCQkJCTIwDQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0MyS19T
V19SU1QJCQkJMjENCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfUEVSSV9TV19SU1QJCQkJMjINCisj
ZGVmaW5lIE1UODE5Ml9UT1BSR1VfUEVSSV9BT19TV19SU1QJCQkyMw0KKw0KKyNkZWZpbmUgTVQ4
MTkyX1RPUFJHVV9TV19SU1RfTlVNCQkJCTIzDQorDQorI2VuZGlmICAvKiBfRFRfQklORElOR1Nf
UkVTRVRfQ09OVFJPTExFUl9NVDgxOTIgKi8NCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

