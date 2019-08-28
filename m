Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 229449FFB8
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2019 12:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfH1KYZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Aug 2019 06:24:25 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:60554 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbfH1KYY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Aug 2019 06:24:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 07E1F42ECE;
        Wed, 28 Aug 2019 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:date:subject
        :subject:from:from:received:received:received; s=mta-01; t=
        1566987860; x=1568802261; bh=87VA5h5waSDTUF2CVQN/4Wwh9JYi5VNM4bl
        aFGLhSMY=; b=ftjErji2haH19AzZFUWJf73ObDZba5bpxrSSs758XIdfDgACCZk
        jPlBP+oacojsvpJcH/Aq0ofG5bq36R++M4CPVB+RcmRQYJxUXVx26Iyk/bGeYABI
        10uOLFbik5rkwD2UUHG7HkcmPXm+H/zjYStNE9UUWOOxCX8ZpzlFMMas=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id maoMV8-Mbqiy; Wed, 28 Aug 2019 13:24:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id D90F3404CB;
        Wed, 28 Aug 2019 13:24:20 +0300 (MSK)
Received: from localhost.dev.yadro.com (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 28 Aug 2019 13:24:20 +0300
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
Subject: [PATCH v4 4/4] aspeed/watchdog: Add access_cs0 option for alt-boot
Date:   Wed, 28 Aug 2019 13:24:02 +0300
Message-ID: <20190828102402.13155-5-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828102402.13155-1-i.mikhaylov@yadro.com>
References: <20190828102402.13155-1-i.mikhaylov@yadro.com>
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

The option for the ast2400/2500 to get access to CS0 at runtime.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 .../ABI/testing/sysfs-class-watchdog          | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
index 6317ade5ad19..675f9b537661 100644
--- a/Documentation/ABI/testing/sysfs-class-watchdog
+++ b/Documentation/ABI/testing/sysfs-class-watchdog
@@ -72,3 +72,37 @@ Description:
 		It is a read/write file. When read, the currently assigned
 		pretimeout governor is returned.  When written, it sets
 		the pretimeout governor.
+
+What:		/sys/class/watchdog/watchdog1/access_cs0
+Date:		August 2019
+Contact:	Ivan Mikhaylov <i.mikhaylov@yadro.com>,
+		Alexander Amelkin <a.amelkin@yadro.com>
+Description:
+		It is a read/write file. This attribute exists only if the
+		system has booted from the alternate flash chip due to
+		expiration of a watchdog timer of AST2400/AST2500 when
+		alternate boot function was enabled with 'aspeed,alt-boot'
+		devicetree option for that watchdog or with an appropriate
+		h/w strapping (for WDT2 only).
+
+		At alternate flash the 'access_cs0' sysfs node provides:
+			ast2400: a way to get access to the primary SPI flash
+				chip at CS0 after booting from the alternate
+				chip at CS1.
+			ast2500: a way to restore the normal address mapping
+				from (CS0->CS1, CS1->CS0) to (CS0->CS0,
+				CS1->CS1).
+
+		Clearing the boot code selection and timeout counter also
+		resets to the initial state the chip select line mapping. When
+		the SoC is in normal mapping state (i.e. booted from CS0),
+		clearing those bits does nothing for both versions of the SoC.
+		For alternate boot mode (booted from CS1 due to wdt2
+		expiration) the behavior differs as described above.
+
+		This option can be used with wdt2 (watchdog1) only.
+
+		When read, the current status of the boot code selection is
+		shown. When written with any non-zero value, it clears
+		the boot code selection and the timeout counter, which results
+		in chipselect reset for AST2400/AST2500.
-- 
2.20.1

