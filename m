Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3309AB5E
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Aug 2019 11:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfHWJcQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Aug 2019 05:32:16 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:52540 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726956AbfHWJcQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Aug 2019 05:32:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id EA22042004;
        Fri, 23 Aug 2019 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1566552734;
         x=1568367135; bh=mEhEh6gAJzPJESzZ96RxoI02+oLNMejWhrwLDGL5SN0=; b=
        NFe3NNlsz6GbLgc6sqhe1gGbfN2wXfEp2JXm+L+8b203mNH69M/oQsHdmK3TJyKt
        HHqfVA6QVZZ8WLMybaKdlADiC+jykNCugN+DgrY8VLwviCDjjFp4wCfr30FgEr8j
        bx854Nbn+VRIAx2OLO31Hb4lDZiuUA1MzjPD80SUAOA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SqQBAZp0LN-d; Fri, 23 Aug 2019 12:32:14 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id E3BD3411F9;
        Fri, 23 Aug 2019 12:32:13 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 23 Aug 2019 12:32:12 +0300
Message-ID: <2453eedbc9746978c0a4b5b17f876d4b48a590dc.camel@yadro.com>
Subject: [PATCH v1 1/3] vesnin: add wdt2 section with alt-boot option
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>,
        <openbmc@lists.ozlabs.org>
Date:   Fri, 23 Aug 2019 12:32:09 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Adds wdt2 section with 'alt-boot' option into dts for vesnin.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index 0b9e29c3212e..2ee26c86a32e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -222,3 +222,7 @@
 &vuart {
 	status = "okay";
 };
+
+&wdt2 {
+	aspeed,alt-boot;
+};
-- 
2.20.1


