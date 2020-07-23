Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F5122AB62
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 11:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgGWJIi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 05:08:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53277 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725846AbgGWJIh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 05:08:37 -0400
X-UUID: e688cd92ae684cde90bc38f83fef41d5-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZhQVYTDpx15IXe+66gCp4ZlkiHNdCG9Gg9lEAFNxsc8=;
        b=AlRz9Ou3P1qX5LYNDulC76rO1cnxJiwL1LGI/RKyibPWyyu8LaP/jYWXHczifBelIX8k3YQtM6yTF7cZArmw8sy7e9gd2816HcN0ihbHla4TMukd6ZwW/bBGSfIvdQpUYyjY7P115BNqYenvqwex7QviPCEY7wpRC1xqYYvkKhg=;
X-UUID: e688cd92ae684cde90bc38f83fef41d5-20200723
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <seiya.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1756576205; Thu, 23 Jul 2020 17:08:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 17:08:22 +0800
From:   Seiya Wang <seiya.wang@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>
Subject: [PATCH 1/4] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
Date:   Thu, 23 Jul 2020 17:07:28 +0800
Message-ID: <20200723090731.4482-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200723090731.4482-1-seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIGJhc2ljIGNoaXAgc3VwcG9ydCBmb3IgTWVkaWF0ZWsgTVQ4MTkyLCBpbmNsdWRlIHVhcnQs
IHdhdGNoZG9nLCBzcGksDQpwaW5jdHJsLCBwd3JhcCBhbmQgY2xvY2sgY29udHJvbGxlciBub2Rl
cy4NCg0KU2lnbmVkLW9mZi1ieTogU2VpeWEgV2FuZyA8c2VpeWEud2FuZ0BtZWRpYXRlay5jb20+
DQotLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgIHwgICAx
ICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1ldmIuZHRzIHwgIDI5ICsr
DQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSAgICB8IDY2MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA2OTMgaW5zZXJ0aW9u
cygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi1ldmIuZHRzDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLmR0c2kNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlDQpp
bmRleCBhNTdhZjlkYTlmNWMuLjgwMzIwZWQyZDgyYyAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvTWFrZWZpbGUNCkBAIC0xMSw0ICsxMSw1IEBAIGR0Yi0kKENPTkZJR19BUkNIX01FRElB
VEVLKSArPSBtdDgxNzMtZWxtLWhhbmEuZHRiDQogZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUsp
ICs9IG10ODE3My1lbG0taGFuYS1yZXY3LmR0Yg0KIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVL
KSArPSBtdDgxNzMtZXZiLmR0Yg0KIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgx
ODMtZXZiLmR0Yg0KK2R0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgxOTItZXZiLmR0
Yg0KIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDg1MTYtcHVtcGtpbi5kdGINCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1ldmIuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItZXZiLmR0cw0KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uMDIwNTgzN2ZhNjk4DQotLS0gL2Rldi9udWxs
DQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1ldmIuZHRzDQpAQCAt
MCwwICsxLDI5IEBADQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1J
VCkNCisvKg0KKyAqIENvcHlyaWdodCAoQykgMjAyMCBNZWRpYVRlayBJbmMuDQorICogQXV0aG9y
OiBTZWl5YSBXYW5nIDxzZWl5YS53YW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisvZHRzLXYxLzsN
CisjaW5jbHVkZSAibXQ4MTkyLmR0c2kiDQorDQorLyB7DQorCW1vZGVsID0gIk1lZGlhVGVrIE1U
ODE5MiBldmFsdWF0aW9uIGJvYXJkIjsNCisJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
ZXZiIiwgIm1lZGlhdGVrLG10ODE5MiI7DQorDQorCWFsaWFzZXMgew0KKwkJc2VyaWFsMCA9ICZ1
YXJ0MDsNCisJfTsNCisNCisJY2hvc2VuIHsNCisJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6OTIx
NjAwbjgiOw0KKwl9Ow0KKw0KKwltZW1vcnlANDAwMDAwMDAgew0KKwkJZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsNCisJCXJlZyA9IDwwIDB4NDAwMDAwMDAgMCAweDgwMDAwMDAwPjsNCisJfTsNCit9
Ow0KKw0KKyZ1YXJ0MCB7DQorCXN0YXR1cyA9ICJva2F5IjsNCit9Ow0KZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi43ZDcyNGYyNGZjOWUNCi0tLSAvZGV2L251bGwNCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kNCkBAIC0wLDAgKzEsNjYzIEBADQorLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkNCisvKg0KKyAqIENvcHlyaWdo
dCAoQykgMjAyMCBNZWRpYVRlayBJbmMuDQorICogQXV0aG9yOiBTZWl5YSBXYW5nIDxzZWl5YS53
YW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisNCisvZHRzLXYxLzsNCisjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPg0KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2lycS5oPg0KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL210ODE5
Mi1waW5mdW5jLmg+DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE5Mi1wb3dlci5o
Pg0KKw0KKy8gew0KKwljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5MiI7DQorCWludGVycnVw
dC1wYXJlbnQgPSA8JmdpYz47DQorCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KKwkjc2l6ZS1jZWxs
cyA9IDwyPjsNCisNCisJY2xrMjZtOiBvc2NpbGxhdG9yQDAgew0KKwkJY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7DQorCQkjY2xvY2stY2VsbHMgPSA8MD47DQorCQljbG9jay1mcmVxdWVuY3kg
PSA8MjYwMDAwMDA+Ow0KKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImNsazI2bSI7DQorCX07DQor
DQorCWNsazMyazogb3NjaWxsYXRvckAxIHsNCisJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2si
Ow0KKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KKwkJY2xvY2stZnJlcXVlbmN5ID0gPDMyNzY4PjsN
CisJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJjbGszMmsiOw0KKwl9Ow0KKw0KKwljcHVzIHsNCisJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKwkJI3NpemUtY2VsbHMgPSA8MD47DQorDQorCQljcHUw
OiBjcHVAMCB7DQorCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCisJCQljb21wYXRpYmxlID0gImFy
bSxjb3J0ZXgtYTU1IjsNCisJCQlyZWcgPSA8MHgwMDA+Ow0KKwkJCWVuYWJsZS1tZXRob2QgPSAi
cHNjaSI7DQorCQkJY2xvY2stZnJlcXVlbmN5ID0gPDE3MDEwMDAwMDA+Ow0KKwkJCW5leHQtbGV2
ZWwtY2FjaGUgPSA8JmwyXzA+Ow0KKwkJCWNhcGFjaXR5LWRtaXBzLW1oeiA9IDw3Njg+Ow0KKwkJ
fTsNCisNCisJCWNwdTE6IGNwdUAxMDAgew0KKwkJCWRldmljZV90eXBlID0gImNwdSI7DQorCQkJ
Y29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1NSI7DQorCQkJcmVnID0gPDB4MTAwPjsNCisJCQll
bmFibGUtbWV0aG9kID0gInBzY2kiOw0KKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxNzAxMDAwMDAw
PjsNCisJCQluZXh0LWxldmVsLWNhY2hlID0gPCZsMl8wPjsNCisJCQljYXBhY2l0eS1kbWlwcy1t
aHogPSA8NzY4PjsNCisJCX07DQorDQorCQljcHUyOiBjcHVAMjAwIHsNCisJCQlkZXZpY2VfdHlw
ZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTUiOw0KKwkJCXJlZyA9
IDwweDIwMD47DQorCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsNCisJCQljbG9jay1mcmVxdWVu
Y3kgPSA8MTcwMTAwMDAwMD47DQorCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfMD47DQorCQkJ
Y2FwYWNpdHktZG1pcHMtbWh6ID0gPDc2OD47DQorCQl9Ow0KKw0KKwkJY3B1MzogY3B1QDMwMCB7
DQorCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCisJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgt
YTU1IjsNCisJCQlyZWcgPSA8MHgzMDA+Ow0KKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQor
CQkJY2xvY2stZnJlcXVlbmN5ID0gPDE3MDEwMDAwMDA+Ow0KKwkJCW5leHQtbGV2ZWwtY2FjaGUg
PSA8JmwyXzA+Ow0KKwkJCWNhcGFjaXR5LWRtaXBzLW1oeiA9IDw3Njg+Ow0KKwkJfTsNCisNCisJ
CWNwdTQ6IGNwdUA0MDAgew0KKwkJCWRldmljZV90eXBlID0gImNwdSI7DQorCQkJY29tcGF0aWJs
ZSA9ICJhcm0sY29ydGV4LWE3NiI7DQorCQkJcmVnID0gPDB4NDAwPjsNCisJCQllbmFibGUtbWV0
aG9kID0gInBzY2kiOw0KKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMTcxMDAwMDAwPjsNCisJCQlu
ZXh0LWxldmVsLWNhY2hlID0gPCZsMl8xPjsNCisJCQljYXBhY2l0eS1kbWlwcy1taHogPSA8MTAy
ND47DQorCQl9Ow0KKw0KKwkJY3B1NTogY3B1QDUwMCB7DQorCQkJZGV2aWNlX3R5cGUgPSAiY3B1
IjsNCisJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTc2IjsNCisJCQlyZWcgPSA8MHg1MDA+
Ow0KKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQorCQkJY2xvY2stZnJlcXVlbmN5ID0gPDIx
NzEwMDAwMDA+Ow0KKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyXzE+Ow0KKwkJCWNhcGFjaXR5
LWRtaXBzLW1oeiA9IDwxMDI0PjsNCisJCX07DQorDQorCQljcHU2OiBjcHVANjAwIHsNCisJCQlk
ZXZpY2VfdHlwZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNzYiOw0K
KwkJCXJlZyA9IDwweDYwMD47DQorCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsNCisJCQljbG9j
ay1mcmVxdWVuY3kgPSA8MjE3MTAwMDAwMD47DQorCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJf
MT47DQorCQkJY2FwYWNpdHktZG1pcHMtbWh6ID0gPDEwMjQ+Ow0KKwkJfTsNCisNCisJCWNwdTc6
IGNwdUA3MDAgew0KKwkJCWRldmljZV90eXBlID0gImNwdSI7DQorCQkJY29tcGF0aWJsZSA9ICJh
cm0sY29ydGV4LWE3NiI7DQorCQkJcmVnID0gPDB4NzAwPjsNCisJCQllbmFibGUtbWV0aG9kID0g
InBzY2kiOw0KKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMTcxMDAwMDAwPjsNCisJCQluZXh0LWxl
dmVsLWNhY2hlID0gPCZsMl8xPjsNCisJCQljYXBhY2l0eS1kbWlwcy1taHogPSA8MTAyND47DQor
CQl9Ow0KKw0KKwkJY3B1LW1hcCB7DQorCQkJY2x1c3RlcjAgew0KKwkJCQljb3JlMCB7DQorCQkJ
CQljcHUgPSA8JmNwdTA+Ow0KKwkJCQl9Ow0KKwkJCQljb3JlMSB7DQorCQkJCQljcHUgPSA8JmNw
dTE+Ow0KKwkJCQl9Ow0KKwkJCQljb3JlMiB7DQorCQkJCQljcHUgPSA8JmNwdTI+Ow0KKwkJCQl9
Ow0KKwkJCQljb3JlMyB7DQorCQkJCQljcHUgPSA8JmNwdTM+Ow0KKwkJCQl9Ow0KKwkJCX07DQor
DQorCQkJY2x1c3RlcjEgew0KKwkJCQljb3JlMCB7DQorCQkJCQljcHUgPSA8JmNwdTQ+Ow0KKwkJ
CQl9Ow0KKwkJCQljb3JlMSB7DQorCQkJCQljcHUgPSA8JmNwdTU+Ow0KKwkJCQl9Ow0KKwkJCQlj
b3JlMiB7DQorCQkJCQljcHUgPSA8JmNwdTY+Ow0KKwkJCQl9Ow0KKwkJCQljb3JlMyB7DQorCQkJ
CQljcHUgPSA8JmNwdTc+Ow0KKwkJCQl9Ow0KKwkJCX07DQorCQl9Ow0KKw0KKwkJbDJfMDogbDIt
Y2FjaGUwIHsNCisJCQljb21wYXRpYmxlID0gImNhY2hlIjsNCisJCQluZXh0LWxldmVsLWNhY2hl
ID0gPCZsM18wPjsNCisJCX07DQorDQorCQlsMl8xOiBsMi1jYWNoZTEgew0KKwkJCWNvbXBhdGli
bGUgPSAiY2FjaGUiOw0KKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwzXzA+Ow0KKwkJfTsNCisN
CisJCWwzXzA6IGwzLWNhY2hlIHsNCisJCQljb21wYXRpYmxlID0gImNhY2hlIjsNCisJCX07DQor
CX07DQorDQorCXBtdS1hNTUgew0KKwkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1NS1wbXUi
Ow0KKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsNCisJCWludGVycnVwdHMgPSA8R0lDX1BQ
SSA3IElSUV9UWVBFX0xFVkVMX0hJR0ggJnBwaV9jbHVzdGVyMD47DQorCX07DQorDQorCXBtdS1h
NzYgew0KKwkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE3Ni1wbXUiOw0KKwkJaW50ZXJydXB0
LXBhcmVudCA9IDwmZ2ljPjsNCisJCWludGVycnVwdHMgPSA8R0lDX1BQSSA3IElSUV9UWVBFX0xF
VkVMX0hJR0ggJnBwaV9jbHVzdGVyMT47DQorCX07DQorDQorCXBzY2kgew0KKwkJY29tcGF0aWJs
ZSA9ICJhcm0scHNjaS0xLjAiOw0KKwkJbWV0aG9kID0gInNtYyI7DQorCX07DQorDQorCXRpbWVy
OiB0aW1lciB7DQorCQljb21wYXRpYmxlID0gImFybSxhcm12OC10aW1lciI7DQorCQlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZnaWM+Ow0KKwkJaW50ZXJydXB0cyA9IDxHSUNfUFBJIDEzIElSUV9UWVBF
X0xFVkVMX0hJR0ggMD4sDQorCQkJICAgICA8R0lDX1BQSSAxNCBJUlFfVFlQRV9MRVZFTF9ISUdI
IDA+LA0KKwkJCSAgICAgPEdJQ19QUEkgMTEgSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCisJCQkg
ICAgIDxHSUNfUFBJIDEwIElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQorCQljbG9jay1mcmVxdWVu
Y3kgPSA8MTMwMDAwMDA+Ow0KKwl9Ow0KKw0KKwlzb2Mgew0KKwkJI2FkZHJlc3MtY2VsbHMgPSA8
Mj47DQorCQkjc2l6ZS1jZWxscyA9IDwyPjsNCisJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7
DQorCQlyYW5nZXM7DQorDQorCQlnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGMwMDAwMDAgew0K
KwkJCWNvbXBhdGlibGUgPSAiYXJtLGdpYy12MyI7DQorCQkJI2ludGVycnVwdC1jZWxscyA9IDw0
PjsNCisJCQkjcmVkaXN0cmlidXRvci1yZWdpb25zID0gPDE+Ow0KKwkJCWludGVycnVwdC1wYXJl
bnQgPSA8JmdpYz47DQorCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7DQorCQkJcmVnID0gPDAgMHgw
YzAwMDAwMCAwIDB4NDAwMDA+LA0KKwkJCSAgICAgIDwwIDB4MGMwNDAwMDAgMCAweDIwMDAwMD47
DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCisN
CisJCQlwcGktcGFydGl0aW9ucyB7DQorCQkJCXBwaV9jbHVzdGVyMDogaW50ZXJydXB0LXBhcnRp
dGlvbi0wIHsNCisJCQkJCWFmZmluaXR5ID0gPCZjcHUwICZjcHUxICZjcHUyICZjcHUzPjsNCisJ
CQkJfTsNCisJCQkJcHBpX2NsdXN0ZXIxOiBpbnRlcnJ1cHQtcGFydGl0aW9uLTEgew0KKwkJCQkJ
YWZmaW5pdHkgPSA8JmNwdTQgJmNwdTUgJmNwdTYgJmNwdTc+Ow0KKwkJCQl9Ow0KKwkJCX07DQor
CQl9Ow0KKw0KKwkJdG9wY2tnZW46IHRvcGNrZ2VuQDEwMDAwMDAwIHsNCisJCQljb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Mi10b3Bja2dlbiIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4
MTAwMDAwMDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQor
CQlpbmZyYWNmZzogaW5mcmFjZmdAMTAwMDEwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLWluZnJhY2ZnIiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxMDAwMTAwMCAw
IDB4MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCXBlcmljZmc6
IHBlcmljZmdAMTAwMDMwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXBl
cmljZmciLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDEwMDAzMDAwIDAgMHgxMDAwPjsNCisJ
CQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJcGlvOiBwaW5jdHJsQDEwMDA1MDAw
IHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1waW5jdHJsIjsNCisJCQlyZWcg
PSA8MCAweDEwMDA1MDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAweDExYzIwMDAwIDAgMHgx
MDAwPiwNCisJCQkgICAgICA8MCAweDExZDEwMDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAw
eDExZDMwMDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAweDExZDQwMDAwIDAgMHgxMDAwPiwN
CisJCQkgICAgICA8MCAweDExZTIwMDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAweDExZTcw
MDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAweDExZWEwMDAwIDAgMHgxMDAwPiwNCisJCQkg
ICAgICA8MCAweDExZjIwMDAwIDAgMHgxMDAwPiwNCisJCQkgICAgICA8MCAweDExZjMwMDAwIDAg
MHgxMDAwPiwNCisJCQkgICAgICA8MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsNCisJCQlyZWctbmFt
ZXMgPSAiaW9jZmcwIiwgImlvY2ZnX3JtIiwgImlvY2ZnX2JtIiwNCisJCQkJICAgICJpb2NmZ19i
bCIsICJpb2NmZ19iciIsICJpb2NmZ19sbSIsDQorCQkJCSAgICAiaW9jZmdfbGIiLCAiaW9jZmdf
cnQiLCAiaW9jZmdfbHQiLA0KKwkJCQkgICAgImlvY2ZnX3RsIiwgImVpbnQiOw0KKwkJCWdwaW8t
Y29udHJvbGxlcjsNCisJCQkjZ3Bpby1jZWxscyA9IDwyPjsNCisJCQlncGlvLXJhbmdlcyA9IDwm
cGlvIDAgMCAyMjA+Ow0KKwkJCWludGVycnVwdC1jb250cm9sbGVyOw0KKwkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyMTIgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCisJCQkjaW50ZXJydXB0LWNl
bGxzID0gPDI+Ow0KKwkJfTsNCisNCisJCXNjcHN5czogcG93ZXItY29udHJvbGxlckAxMDAwNjAw
MCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItc2Nwc3lzIiwgInN5c2NvbiI7
DQorCQkJcmVnID0gPDAgMHgxMDAwNjAwMCAwIDB4MTAwMD47DQorCQkJI3Bvd2VyLWRvbWFpbi1j
ZWxscyA9IDwxPjsNCisJCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfTUZHX1BMTF9TRUw+
LA0KKwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX0lNRzFfU0VMPiwNCisJCQkJIDwmdG9wY2tnZW4g
Q0xLX1RPUF9JTUcyX1NFTD4sDQorCQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfSVBFX1NFTD4sDQor
CQkJCSA8JnRvcGNrZ2VuIENMS19UT1BfVkRFQ19TRUw+LA0KKwkJCQkgPCZ0b3Bja2dlbiBDTEtf
VE9QX1ZFTkNfU0VMPiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9NRFBfU0VMPiwNCisJCQkJ
IDwmdG9wY2tnZW4gQ0xLX1RPUF9ESVNQX1NFTD4sDQorCQkJCSA8JnRvcGNrZ2VuIENMS19UT1Bf
QVVEX0lOVEJVU19TRUw+LA0KKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfQVVESU9fMjZNX0I+
LA0KKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfQVVESU8+LA0KKwkJCQkgPCZ0b3Bja2dlbiBD
TEtfVE9QX0FEU1BfU0VMPiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9DQU1fU0VMPiwNCisJ
CQkJIDwmaW1nc3lzIENMS19JTUdfTEFSQjk+LA0KKwkJCQkgPCZpbWdzeXMgQ0xLX0lNR19HQUxT
PiwNCisJCQkJIDwmaW1nc3lzMiBDTEtfSU1HMl9MQVJCMTE+LA0KKwkJCQkgPCZpbWdzeXMyIENM
S19JTUcyX0dBTFM+LA0KKwkJCQkgPCZpcGVzeXMgQ0xLX0lQRV9MQVJCMTk+LA0KKwkJCQkgPCZp
cGVzeXMgQ0xLX0lQRV9MQVJCMjA+LA0KKwkJCQkgPCZpcGVzeXMgQ0xLX0lQRV9TTUlfU1VCQ09N
PiwNCisJCQkJIDwmaXBlc3lzIENMS19JUEVfR0FMUz4sDQorCQkJCSA8JnZkZWNzeXNfc29jIENM
S19WREVDX1NPQ19WREVDPiwNCisJCQkJIDwmdmRlY3N5c19zb2MgQ0xLX1ZERUNfU09DX0xBVD4s
DQorCQkJCSA8JnZkZWNzeXNfc29jIENMS19WREVDX1NPQ19MQVJCMT4sDQorCQkJCSA8JnZkZWNz
eXMgQ0xLX1ZERUNfVkRFQz4sDQorCQkJCSA8JnZkZWNzeXMgQ0xLX1ZERUNfTEFUPiwNCisJCQkJ
IDwmdmRlY3N5cyBDTEtfVkRFQ19MQVJCMT4sDQorCQkJCSA8JnZlbmNzeXMgQ0xLX1ZFTkNfU0VU
MV9WRU5DPiwNCisJCQkJIDwmbWRwc3lzIENMS19NRFBfU01JMD4sDQorCQkJCSA8Jm1tc3lzIENM
S19NTV9TTUlfSU5GUkE+LA0KKwkJCQkgPCZtbXN5cyBDTEtfTU1fU01JX0NPTU1PTj4sDQorCQkJ
CSA8Jm1tc3lzIENMS19NTV9TTUlfR0FMUz4sDQorCQkJCSA8Jm1tc3lzIENMS19NTV9TTUlfSU9N
TVU+LA0KKwkJCQkgPCZjYW1zeXMgQ0xLX0NBTV9MQVJCMTM+LA0KKwkJCQkgPCZjYW1zeXMgQ0xL
X0NBTV9MQVJCMTQ+LA0KKwkJCQkgPCZjYW1zeXMgQ0xLX0NBTV9DQ1VfR0FMUz4sDQorCQkJCSA8
JmNhbXN5cyBDTEtfQ0FNX0NBTTJNTV9HQUxTPiwNCisJCQkJIDwmY2Ftc3lzX3Jhd2EgQ0xLX0NB
TV9SQVdBX0xBUkJYPiwNCisJCQkJIDwmY2Ftc3lzX3Jhd2IgQ0xLX0NBTV9SQVdCX0xBUkJYPiwN
CisJCQkJIDwmY2Ftc3lzX3Jhd2MgQ0xLX0NBTV9SQVdDX0xBUkJYPjsNCisJCQljbG9jay1uYW1l
cyA9ICJtZmciLCAiaXNwIiwgImlzcDIiLCAiaXBlIiwgInZkZWMiLA0KKwkJCQkgICAgICAidmVu
YyIsICJtZHAiLCAiZGlzcCIsICJhdWRpbyIsICJhdWRpbzEiLA0KKwkJCQkgICAgICAiYXVkaW8y
IiwgImFkc3AiLCAiY2FtIiwgImlzcC0wIiwNCisJCQkJICAgICAgImlzcC0xIiwgImlzcDItMCIs
ICJpc3AyLTEiLCAiaXBlLTAiLA0KKwkJCQkgICAgICAiaXBlLTEiLCAiaXBlLTIiLCAiaXBlLTMi
LCAidmRlYy0wIiwNCisJCQkJICAgICAgInZkZWMtMSIsICJ2ZGVjLTIiLCAidmRlYzItMCIsICJ2
ZGVjMi0xIiwNCisJCQkJICAgICAgInZkZWMyLTIiLCAidmVuYy0wIiwgIm1kcC0wIiwgImRpc3At
MCIsDQorCQkJCSAgICAgICJkaXNwLTEiLCAiZGlzcC0yIiwgImRpc3AtMyIsICJjYW0tMCIsDQor
CQkJCSAgICAgICJjYW0tMSIsICJjYW0tMiIsICJjYW0tMyIsICJjYW1fcmF3YS0wIiwNCisJCQkJ
ICAgICAgImNhbV9yYXdiLTAiLCAiY2FtX3Jhd2MtMCI7DQorCQkJaW5mcmFjZmcgPSA8JmluZnJh
Y2ZnPjsNCisJCX07DQorDQorCQl3YXRjaGRvZzogd2F0Y2hkb2dAMTAwMDcwMDAgew0KKwkJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXdkdCI7DQorCQkJcmVnID0gPDAgMHgxMDAwNzAw
MCAwIDB4MTAwPjsNCisJCQkjcmVzZXQtY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJYXBtaXhl
ZHN5czogYXBtaXhlZHN5c0AxMDAwYzAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTItYXBtaXhlZHN5cyIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTAwMGMwMDAgMCAw
eDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQlwd3JhcDogcHdy
YXBAMTAwMjYwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2ODczLXB3cmFwIjsN
CisJCQlyZWcgPSA8MCAweDEwMDI2MDAwIDAgMHgxMDAwPjsNCisJCQlyZWctbmFtZXMgPSAicHdy
YXAiOw0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyMjAgSVJRX1RZUEVfTEVWRUxfSElHSCAw
PjsNCisJCQljbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX0FQPiwNCisJCQkJIDwm
aW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfVE1SPjsNCisJCQljbG9jay1uYW1lcyA9ICJzcGkiLCAi
d3JhcCI7DQorCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1BXUkFQX1VM
UE9TQ19TRUw+Ow0KKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuIENMS19U
T1BfT1NDX0QxMD47DQorCQl9Ow0KKw0KKwkJc3BtaV9idXM6IHNwbWlAMTAwMjcwMDAgew0KKwkJ
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWsscG1pZiI7DQorCQkJcmVnID0gPDAgMHgxMDAyNzAwMCAw
IDB4MDAwZTAwPiwNCisJCQkgICAgICA8MCAweDEwMDI3ZjAwIDAgMHgwMDAwOGM+LA0KKwkJCSAg
ICAgIDwwIDB4MTAwMjkwMDAgMCAweDAwMDEwMD47DQorCQkJcmVnLW5hbWVzID0gInBtaWYiLCAi
cG1pZm1wdSIsICJzcG1pbXN0IjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjIxIElSUV9U
WVBFX0xFVkVMX0hJR0ggMD47DQorCQkJaW50ZXJydXB0LW5hbWVzID0gInBtaWZfaXJxIjsNCisJ
CQlpcnFfZXZlbnRfZW4gPSA8MHgwIDB4MCAweDAwMzAwMDAwIDB4MDAwMDAxMDAgMHgwPjsNCisJ
CQljbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX0FQPiwNCisJCQkJIDwmaW5mcmFj
ZmcgQ0xLX0lORlJBX1BNSUNfVE1SPiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUE1JX01T
VF9TRUw+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBtaWZfc3lzX2NrIiwNCisJCQkJICAgICAgInBt
aWZfdG1yX2NrIiwNCisJCQkJICAgICAgInNwbWltc3RfY2xrX211eCI7DQorCQkJYXNzaWduZWQt
Y2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1BXUkFQX1VMUE9TQ19TRUw+Ow0KKwkJCWFzc2ln
bmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuIENMS19UT1BfT1NDX0QxMD47DQorCQkJc3dp
bmZfY2hfc3RhcnQgPSA8ND47DQorCQkJYXBfc3dpbmZfbm8gPSA8Mj47DQorCQl9Ow0KKw0KKwkJ
c2NwX2Fkc3A6IHNjcF9hZHNwQDEwNzIwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE5Mi1zY3BfYWRzcCIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTA3MjAwMDAgMCAw
eDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQl1YXJ0MDogc2Vy
aWFsQDExMDAyMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi11YXJ0IiwN
CisJCQkJICAgICAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiOw0KKwkJCXJlZyA9IDwwIDB4MTEwMDIw
MDAgMCAweDEwMDA+Ow0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMDkgSVJRX1RZUEVfTEVW
RUxfSElHSCAwPjsNCisJCQljbG9ja3MgPSA8JmNsazI2bT4sIDwmaW5mcmFjZmcgQ0xLX0lORlJB
X1VBUlQwPjsNCisJCQljbG9jay1uYW1lcyA9ICJiYXVkIiwgImJ1cyI7DQorCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCisJCX07DQorDQorCQl1YXJ0MTogc2VyaWFsQDExMDAzMDAwIHsNCisJCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi11YXJ0IiwNCisJCQkJICAgICAibWVkaWF0ZWss
bXQ2NTc3LXVhcnQiOw0KKwkJCXJlZyA9IDwwIDB4MTEwMDMwMDAgMCAweDEwMDA+Ow0KKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxMTAgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCisJCQljbG9j
a3MgPSA8JmNsazI2bT4sIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1VBUlQxPjsNCisJCQljbG9jay1u
YW1lcyA9ICJiYXVkIiwgImJ1cyI7DQorCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCX07DQor
DQorCQlpbXBfaWljX3dyYXBfYzogaW1wX2lpY193cmFwX2NAMTEwMDcwMDAgew0KKwkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWltcF9paWNfd3JhcF9jIiwgInN5c2NvbiI7DQorCQkJ
cmVnID0gPDAgMHgxMTAwNzAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0K
KwkJfTsNCisNCisJCXNwaTA6IHNwaUAxMTAwYTAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxOTItc3BpIiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0g
PDAgMHgxMTAwYTAwMCAwIDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE1OSBJ
UlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9N
QUlOUExMX0Q1X0Q0PiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJ
IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1NQSTA+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1j
bGsiLCAic2VsLWNsayIsICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJ
fTsNCisNCisJCXNwaTE6IHNwaUAxMTAxMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTItc3BpIiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAg
MHgxMTAxMDAwMCAwIDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MCBJUlFf
VFlQRV9MRVZFTF9ISUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlO
UExMX0Q1X0Q0PiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwm
aW5mcmFjZmcgQ0xLX0lORlJBX1NQSTE+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsi
LCAic2VsLWNsayIsICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsN
CisNCisJCXNwaTI6IHNwaUAxMTAxMjAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTItc3BpIiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgx
MTAxMjAwMCAwIDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MSBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExM
X0Q1X0Q0PiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5m
cmFjZmcgQ0xLX0lORlJBX1NQSTI+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAi
c2VsLWNsayIsICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisN
CisJCXNwaTM6IHNwaUAxMTAxMzAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTItc3BpIiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgxMTAx
MzAwMCAwIDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MiBJUlFfVFlQRV9M
RVZFTF9ISUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1
X0Q0PiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5mcmFj
ZmcgQ0xLX0lORlJBX1NQSTM+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2Vs
LWNsayIsICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJ
CXNwaTQ6IHNwaUAxMTAxODAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
c3BpIiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgxMTAxODAw
MCAwIDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2MyBJUlFfVFlQRV9MRVZF
TF9ISUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0
PiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5mcmFjZmcg
Q0xLX0lORlJBX1NQSTQ+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNs
ayIsICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJCXNw
aTU6IHNwaUAxMTAxOTAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItc3Bp
IiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgxMTAxOTAwMCAw
IDB4MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2NCBJUlFfVFlQRV9MRVZFTF9I
SUdIIDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0PiwN
CisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5mcmFjZmcgQ0xL
X0lORlJBX1NQSTU+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNsayIs
ICJzcGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJCXNwaTY6
IHNwaUAxMTAxZDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItc3BpIiwN
CisJCQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgxMTAxZDAwMCAwIDB4
MTAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2NSBJUlFfVFlQRV9MRVZFTF9ISUdI
IDA+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0PiwNCisJ
CQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lO
RlJBX1NQSTY+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNsayIsICJz
cGktY2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJCXNwaTc6IHNw
aUAxMTAxZTAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItc3BpIiwNCisJ
CQkJICAgICAibWVkaWF0ZWssbXQ2NzY1LXNwaSI7DQorCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQorCQkJI3NpemUtY2VsbHMgPSA8MD47DQorCQkJcmVnID0gPDAgMHgxMTAxZTAwMCAwIDB4MTAw
MD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2NiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+
Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NQUlOUExMX0Q1X0Q0PiwNCisJCQkJ
IDwmdG9wY2tnZW4gQ0xLX1RPUF9TUElfU0VMPiwNCisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJB
X1NQSTc+Ow0KKwkJCWNsb2NrLW5hbWVzID0gInBhcmVudC1jbGsiLCAic2VsLWNsayIsICJzcGkt
Y2xrIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJCWF1ZHN5czogYXVk
c3lzQDExMjEwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1hdWRzeXMi
LCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDExMjEwMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xv
Y2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJaW1wX2lpY193cmFwX2U6IGltcF9paWNfd3Jh
cF9lQDExY2IxMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1pbXBfaWlj
X3dyYXBfZSIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTFjYjEwMDAgMCAweDEwMDA+Ow0K
KwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQlpbXBfaWljX3dyYXBfczogaW1w
X2lpY193cmFwX3NAMTFkMDMwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTky
LWltcF9paWNfd3JhcF9zIiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxMWQwMzAwMCAwIDB4
MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCWltcF9paWNfd3Jh
cF93czogaW1wX2lpY193cmFwX3dzQDExZDIzMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5Mi1pbXBfaWljX3dyYXBfd3MiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDEx
ZDIzMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJ
aW1wX2lpY193cmFwX3c6IGltcF9paWNfd3JhcF93QDExZTAxMDAwIHsNCisJCQljb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Mi1pbXBfaWljX3dyYXBfdyIsICJzeXNjb24iOw0KKwkJCXJlZyA9
IDwwIDB4MTFlMDEwMDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07
DQorDQorCQlpbXBfaWljX3dyYXBfbjogaW1wX2lpY193cmFwX25AMTFmMDIwMDAgew0KKwkJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWltcF9paWNfd3JhcF9uIiwgInN5c2NvbiI7DQor
CQkJcmVnID0gPDAgMHgxMWYwMjAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+
Ow0KKwkJfTsNCisNCisJCW1zZGNfdG9wOiBtc2RjX3RvcEAxMWYxMDAwMCB7DQorCQkJY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbXNkY190b3AiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8
MCAweDExZjEwMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0K
Kw0KKwkJbXNkYzogbXNkY0AxMWY2MDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTItbXNkYyIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTFmNjAwMDAgMCAweDEwMDA+
Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQltZmdjZmc6IG1mZ2NmZ0Ax
M2ZiZjAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbWZnY2ZnIiwgInN5
c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxM2ZiZjAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNl
bGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCW1tc3lzOiBtbXN5c0AxNDAwMDAwMCB7DQorCQkJY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItbW1zeXMiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8
MCAweDE0MDAwMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0K
Kw0KKwkJaW1nc3lzOiBpbWdzeXNAMTUwMjAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLWltZ3N5cyIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTUwMjAwMDAgMCAw
eDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQlpbWdzeXMyOiBp
bWdzeXMyQDE1ODIwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1pbWdz
eXMyIiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxNTgyMDAwMCAwIDB4MTAwMD47DQorCQkJ
I2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCXZkZWNzeXNfc29jOiB2ZGVjc3lzX3Nv
Y0AxNjAwZjAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmRlY3N5c19z
b2MiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDE2MDBmMDAwIDAgMHgxMDAwPjsNCisJCQkj
Y2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJdmRlY3N5czogdmRlY3N5c0AxNjAyZjAw
MCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmRlY3N5cyIsICJzeXNjb24i
Ow0KKwkJCXJlZyA9IDwwIDB4MTYwMmYwMDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9
IDwxPjsNCisJCX07DQorDQorCQl2ZW5jc3lzOiB2ZW5jc3lzQDE3MDAwMDAwIHsNCisJCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi12ZW5jc3lzIiwgInN5c2NvbiI7DQorCQkJcmVnID0g
PDAgMHgxNzAwMDAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsN
CisNCisJCWFwdV9jb25uOiBhcHVfY29ubkAxOTAyMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTItYXB1X2Nvbm4iLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDE5MDIw
MDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJYXB1
X3Zjb3JlOiBhcHVfdmNvcmVAMTkwMjkwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTkyLWFwdV92Y29yZSIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTkwMjkwMDAgMCAw
eDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQlhcHUwOiBhcHUw
QDE5MDMwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1hcHUwIiwgInN5
c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxOTAzMDAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNl
bGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCWFwdTE6IGFwdTFAMTkwMzEwMDAgew0KKwkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWFwdTEiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAw
eDE5MDMxMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0K
KwkJYXB1X21kbGEwOiBhcHVfbWRsYTBAMTkwMzQwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTkyLWFwdV9tZGxhMCIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTkwMzQw
MDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQljYW1z
eXM6IGNhbXN5c0AxYTAwMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
Y2Ftc3lzIiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxYTAwMDAwMCAwIDB4MTAwMD47DQor
CQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCWNhbXN5c19yYXdhOiBjYW1zeXNf
cmF3YUAxYTA0ZjAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItY2Ftc3lz
X3Jhd2EiLCAic3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDFhMDRmMDAwIDAgMHgxMDAwPjsNCisJ
CQkjY2xvY2stY2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJY2Ftc3lzX3Jhd2I6IGNhbXN5c19y
YXdiQDFhMDZmMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1jYW1zeXNf
cmF3YiIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MWEwNmYwMDAgMCAweDEwMDA+Ow0KKwkJ
CSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQljYW1zeXNfcmF3YzogY2Ftc3lzX3Jh
d2NAMWEwOGYwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWNhbXN5c19y
YXdjIiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxYTA4ZjAwMCAwIDB4MTAwMD47DQorCQkJ
I2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCWlwZXN5czogaXBlc3lzQDFiMDAwMDAw
IHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1pcGVzeXMiLCAic3lzY29uIjsN
CisJCQlyZWcgPSA8MCAweDFiMDAwMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8
MT47DQorCQl9Ow0KKw0KKwkJbWRwc3lzOiBtZHBzeXNAMWYwMDAwMDAgew0KKwkJCWNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTkyLW1kcHN5cyIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4
MWYwMDAwMDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorCX07
DQorfTsNCi0tIA0KMi4xNC4xDQo=

