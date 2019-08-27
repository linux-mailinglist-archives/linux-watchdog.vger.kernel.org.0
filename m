Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C45C9F0DB
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 18:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbfH0Qyy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 12:54:54 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:40004 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730378AbfH0Qyy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 12:54:54 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 4F2FC42ECD;
        Tue, 27 Aug 2019 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:date:subject
        :subject:from:from:received:received:received; s=mta-01; t=
        1566924891; x=1568739292; bh=GCxrgga2ACU49JHMFa9Qm+9SSWX1i4ngDP9
        HAa9kUNA=; b=PeSrTtWHlfVd34xdod3NoD5BkcVs+NOqWEumOJ5pJQ5/lYX+8jb
        2v07LeuNAJXX2Ax+YhMpKetKwAsDhKEABNtT2eMGtlujedzMdOBgojByqNLUh+1J
        EBsN0cXh/LKo1kP8K7lSdWjFnvFTm5MgO5qDi2N1ACLeZPsGUf2fE1ZQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 484lRlM42xDh; Tue, 27 Aug 2019 19:54:51 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 3BD8642ECA;
        Tue, 27 Aug 2019 19:54:50 +0300 (MSK)
Received: from localhost.dev.yadro.com (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Aug 2019 19:54:50 +0300
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        Alexander Amelkin <a.amelkin@yadro.com>,
        <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: [PATCH v3 2/4] vesnin: add secondary SPI flash chip
Date:   Tue, 27 Aug 2019 19:54:24 +0300
Message-ID: <20190827165426.17037-3-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190827165426.17037-1-i.mikhaylov@yadro.com>
References: <20190827165426.17037-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

