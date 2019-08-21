Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D0497F77
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 17:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfHUPyj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 11:54:39 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:58244 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728459AbfHUPyj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 11:54:39 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id B630B42ED0;
        Wed, 21 Aug 2019 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1566402876;
         x=1568217277; bh=mEhEh6gAJzPJESzZ96RxoI02+oLNMejWhrwLDGL5SN0=; b=
        GfRFdiR+2woudO0W8abS4m+61cnvnKa2A9m6S5uWNHTdO/sR61m6SsA5GlJ8UY34
        whO5W+Z2l6XWw49SGRp+qpxtacMkb+RT58I0dG/oz9Dt0B3+fUBg5FGpdwSZ5f7q
        QZu8p4uiGQ3klFvJIhmXF2AvXh0u/Yd2hGx7VwCDyHY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id e-29Zo6cjChT; Wed, 21 Aug 2019 18:54:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id C2BED4120B;
        Wed, 21 Aug 2019 18:54:36 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 21 Aug 2019 18:54:35 +0300
Message-ID: <90ee26eca127501ed035f5dcd74f880b0c7e10f5.camel@yadro.com>
Subject: [PATCH 1/3] vesnin: add wdt2 section with alt-boot option
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>
Date:   Wed, 21 Aug 2019 18:54:35 +0300
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


