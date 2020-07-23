Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB8622AB57
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 11:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgGWJIf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 05:08:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63505 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726127AbgGWJIe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 05:08:34 -0400
X-UUID: 57ce595b17674c7ea05b1e91a51ef1f1-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VUimYVBdlfMRsNpI/7dqGrtRjsY9u4/ZFKxfCAFSY+w=;
        b=VLcdCslJXi5AC6hQ6vfWMY7oMwr56EOHEwu7Yt6hvrDSu331yTDS9RYLpc/XnNxs0GZHLe20+Jt3O6VaMYCtwoeb9MjmWXGUHNPeXHYZ0fhWZL/hXzwp4fUzbyhbjIZ2chru6jidg7j2/dVa/bZoqUPlhzcPbApIEYAhnNPJeMs=;
X-UUID: 57ce595b17674c7ea05b1e91a51ef1f1-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <seiya.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1658060345; Thu, 23 Jul 2020 17:08:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 17:08:28 +0800
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
Subject: [PATCH 2/4] dt-bindings: serial: Add compatible for Mediatek MT8192
Date:   Thu, 23 Jul 2020 17:07:29 +0800
Message-ID: <20200723090731.4482-3-seiya.wang@mediatek.com>
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

VGhpcyBjb21taXQgYWRkcyBkdC1iaW5kaW5nIGRvY3VtZW50YXRpb24gb2YgdWFydCBmb3IgTWVk
aWF0ZWsgTVQ4MTkyIFNvQw0KUGxhdGZvcm0uDQoNClNpZ25lZC1vZmYtYnk6IFNlaXlhIFdhbmcg
PHNlaXlhLndhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NlcmlhbC9tdGstdWFydC50eHQgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zZXJpYWwvbXRrLXVhcnQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NlcmlhbC9tdGstdWFydC50eHQNCmluZGV4IDNhM2I1NzA3OWYwZC4uNjQ3YjVhZWU4NmYz
IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9t
dGstdWFydC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
YWwvbXRrLXVhcnQudHh0DQpAQCAtMTksNiArMTksNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
ICAgKiAibWVkaWF0ZWssbXQ4MTM1LXVhcnQiIGZvciBNVDgxMzUgY29tcGF0aWJsZSBVQVJUUw0K
ICAgKiAibWVkaWF0ZWssbXQ4MTczLXVhcnQiIGZvciBNVDgxNzMgY29tcGF0aWJsZSBVQVJUUw0K
ICAgKiAibWVkaWF0ZWssbXQ4MTgzLXVhcnQiLCAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiIGZvciBN
VDgxODMgY29tcGF0aWJsZSBVQVJUUw0KKyAgKiAibWVkaWF0ZWssbXQ4MTkyLXVhcnQiLCAibWVk
aWF0ZWssbXQ2NTc3LXVhcnQiIGZvciBNVDgxOTIgY29tcGF0aWJsZSBVQVJUUw0KICAgKiAibWVk
aWF0ZWssbXQ4NTE2LXVhcnQiIGZvciBNVDg1MTYgY29tcGF0aWJsZSBVQVJUUw0KICAgKiAibWVk
aWF0ZWssbXQ2NTc3LXVhcnQiIGZvciBNVDY1NzcgYW5kIGFsbCBvZiB0aGUgYWJvdmUNCiANCi0t
IA0KMi4xNC4xDQo=

