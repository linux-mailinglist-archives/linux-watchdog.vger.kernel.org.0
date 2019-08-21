Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021DB97F7B
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 17:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHUP4X (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 11:56:23 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:58296 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726828AbfHUP4X (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 11:56:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id BDB3D42ED7;
        Wed, 21 Aug 2019 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1566402980;
         x=1568217381; bh=GCxrgga2ACU49JHMFa9Qm+9SSWX1i4ngDP9HAa9kUNA=; b=
        dFP95R+iR/yL5MbNTHZylkW3r+lFbAO0tOcJMbK3aMNa61EINedRFesxqoYZlm1N
        uhe0jjtDtIjQMsg0BpGq7zInucgfNIHE/Yx4uI9terg+HfjX0yxIvRkqa/wde2mp
        VbAXdCOF3MtAaaPKC2udre29UjfbX3tCkA4ofC1TFwA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GGz6la41J_7N; Wed, 21 Aug 2019 18:56:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id CDFE44120B;
        Wed, 21 Aug 2019 18:56:20 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 21 Aug 2019 18:56:20 +0300
Message-ID: <9aa6b419194701e1c75bac2dc4192a31888a616b.camel@yadro.com>
Subject: [PATCH 2/3] vesnin: add secondary SPI flash chip
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>
Date:   Wed, 21 Aug 2019 18:56:20 +0300
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

Adds secondary SPI flash chip into dts for vesnin.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index 2ee26c86a32e..db4cc3df61ce 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -81,6 +81,14 @@
         label = "bmc";
 #include "openbmc-flash-layout.dtsi"
 	};
+
+	flash@1 {
+		status = "okay";
+		reg = < 1 >;
+		compatible = "jedec,spi-nor";
+		m25p,fast-read;
+		label = "alt";
+	};
 };
 
 &spi {
-- 
2.20.1


