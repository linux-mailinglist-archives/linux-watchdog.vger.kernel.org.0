Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64E22555A0
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgH1HuD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 03:50:03 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57706 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726571AbgH1HuC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 03:50:02 -0400
X-UUID: 4121e747aece49eb94cf3bf6556b20e1-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3WgwFhaLMdkUWyelN9/5DI31mttcEviLuRyGT0q3ZCc=;
        b=Pv+5ikzlk4lG+nEzdDOh6JhkrfGTWyyiM3BnFLMhYwQRJo7G3AYronxNHK8PDntyxMDurWZu21a6RlZn8qOa67bdVkLWdPkjwizTqXAxZLU04YWQE5o1POMzb+0tzHQV45xIJNYTMynxqCFJms5L/v6MkoPjAJ7dNxHXVkNESFo=;
X-UUID: 4121e747aece49eb94cf3bf6556b20e1-20200828
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <freddy.hsin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1015399420; Fri, 28 Aug 2020 15:49:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 15:49:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Aug 2020 15:49:59 +0800
From:   Freddy Hsin <freddy.hsin@mediatek.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
CC:     <wsd_upstream@mediatek.com>, <chang-an.chen@mediatek.com>,
        <kuohong.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
        Freddy Hsin <freddy.hsin@mediatek.com>
Subject: [PATCH v1 1/1] driver: watchdog: Add mtk_wdt_init for mediatek watchdog hw init
Date:   Fri, 28 Aug 2020 15:49:28 +0800
Message-ID: <1598600968-28498-2-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
References: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

MS4gYWRkIGEgaHcgaW5pdGlhbGl6YXRpb24gZnVuY3Rpb24NCjIuIGVuYWJsZS9kaXNhYmxlIHRo
ZSB3YXRjaGRvZyBkZXBlbmRzIG9uIHRoZSBvcmlnaW5hbCBodyBzZXR0aW5nDQozLiBzZXQgV0RP
RF9IV19SVU5OSU5HIGluIHN0YXJ0IGZ1bmN0aW9uIGluIG9yZGVyIHRvIHN0YXJ0DQogICBraWNr
ZXIgYWZ0ZXIgZHJpdmVyIHByb2JlIGFuZCBjbGVhciB0aGUgYml0IGluIHN0b3AgZnVuY3Rpb24N
Cg0KQ2hhbmdlLUlkOiBJMjVhYTc5N2YzYjg4Mjg4ZjI2OTg0NDU1ZTQ5OWU1OTllMjdmMDlmYQ0K
U2lnbmVkLW9mZi1ieTogRnJlZGR5IEhzaW4gPGZyZWRkeS5oc2luQG1lZGlhdGVrLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgICAyMiArKysrKysrKysrKysrKysrKysr
KystDQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVycy93YXRjaGRv
Zy9tdGtfd2R0LmMNCmluZGV4IGQ2YTYzOTMuLjU5YjUwNjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3dhdGNoZG9nL210a193ZHQuYw0KKysrIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCkBA
IC01Nyw2ICs1Nyw5IEBADQogc3RhdGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dBWU9V
VDsNCiBzdGF0aWMgdW5zaWduZWQgaW50IHRpbWVvdXQ7DQogDQorc3RhdGljIGludCBtdGtfd2R0
X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpOw0KK3N0YXRpYyBpbnQgbXRr
X3dkdF9zdG9wKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpOw0KKw0KIHN0cnVjdCBt
dGtfd2R0X2RldiB7DQogCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2Ugd2R0X2RldjsNCiAJdm9pZCBf
X2lvbWVtICp3ZHRfYmFzZTsNCkBAIC0xNDgsNiArMTUxLDE5IEBAIHN0YXRpYyBpbnQgdG9wcmd1
X3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwN
CiAJcmV0dXJuIHJldDsNCiB9DQogDQorc3RhdGljIGludCBtdGtfd2R0X2luaXQoc3RydWN0IHdh
dGNoZG9nX2RldmljZSAqd2R0X2RldikNCit7DQorCXN0cnVjdCBtdGtfd2R0X2RldiAqbXRrX3dk
dCA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkdF9kZXYpOw0KKwl2b2lkIF9faW9tZW0gKndkdF9i
YXNlOw0KKw0KKwl3ZHRfYmFzZSA9IG10a193ZHQtPndkdF9iYXNlOw0KKw0KKwlpZiAocmVhZGwo
d2R0X2Jhc2UgKyBXRFRfTU9ERSkgJiBXRFRfTU9ERV9FTikNCisJCW10a193ZHRfc3RhcnQod2R0
X2Rldik7DQorCWVsc2UNCisJCW10a193ZHRfc3RvcCh3ZHRfZGV2KTsNCit9DQorDQogc3RhdGlj
IGludCBtdGtfd2R0X3Jlc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldiwNCiAJ
CQkgICB1bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0YSkNCiB7DQpAQCAtMjA2LDYgKzIy
Miw4IEBAIHN0YXRpYyBpbnQgbXRrX3dkdF9zdG9wKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndk
dF9kZXYpDQogCXJlZyB8PSBXRFRfTU9ERV9LRVk7DQogCWlvd3JpdGUzMihyZWcsIHdkdF9iYXNl
ICsgV0RUX01PREUpOw0KIA0KKwljbGVhcl9iaXQoV0RPR19IV19SVU5OSU5HLCAmd2R0X2Rldi0+
c3RhdHVzKTsNCisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KQEAgLTIyNSw2ICsyNDMsOCBAQCBzdGF0
aWMgaW50IG10a193ZHRfc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikNCiAJ
cmVnIHw9IChXRFRfTU9ERV9FTiB8IFdEVF9NT0RFX0tFWSk7DQogCWlvd3JpdGUzMihyZWcsIHdk
dF9iYXNlICsgV0RUX01PREUpOw0KIA0KKwlzZXRfYml0KFdET0dfSFdfUlVOTklORywgJndkdF9k
ZXYtPnN0YXR1cyk7DQorDQogCXJldHVybiAwOw0KIH0NCiANCkBAIC0yNzQsNyArMjk0LDcgQEAg
c3RhdGljIGludCBtdGtfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQog
DQogCXdhdGNoZG9nX3NldF9kcnZkYXRhKCZtdGtfd2R0LT53ZHRfZGV2LCBtdGtfd2R0KTsNCiAN
Ci0JbXRrX3dkdF9zdG9wKCZtdGtfd2R0LT53ZHRfZGV2KTsNCisJbXRrX3dkdF9pbml0KCZtdGtf
d2R0LT53ZHRfZGV2KTsNCiANCiAJd2F0Y2hkb2dfc3RvcF9vbl9yZWJvb3QoJm10a193ZHQtPndk
dF9kZXYpOw0KIAllcnIgPSBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZShkZXYsICZtdGtf
d2R0LT53ZHRfZGV2KTsNCi0tIA0KMS43LjkuNQ0K

