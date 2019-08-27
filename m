Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1459F0D1
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 18:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfH0Qyv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 12:54:51 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:39936 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726871AbfH0Qyv (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 12:54:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 83D5541240;
        Tue, 27 Aug 2019 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :x-mailer:message-id:date:date:subject:subject:from:from
        :received:received:received; s=mta-01; t=1566924888; x=
        1568739289; bh=Z6gOnxcpev6cYIQbp+Z/8lEArpM2TigF6DeTVeb0yng=; b=w
        IZvuPAhtKbGrDL5vI541Byi3k4t/VVG8qlxhkPunYd0WpeJ8YxjKh1Narniy9dem
        gqxvb8gdhzrAWRek8M10GRCU9wiYNGyMn2DQ21BrZI8oZAWk2gdgqmLrIW9AJJmJ
        2D6x5oUQ08DHixWWLaLfZfSOqALYiYTykR4ioyqonI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DLqQlwXm_mOd; Tue, 27 Aug 2019 19:54:48 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id B8B3041209;
        Tue, 27 Aug 2019 19:54:47 +0300 (MSK)
Received: from localhost.dev.yadro.com (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Aug 2019 19:54:47 +0300
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
Subject: [PATCH v3 0/4] add dual-boot support
Date:   Tue, 27 Aug 2019 19:54:22 +0300
Message-ID: <20190827165426.17037-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.20.1
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

ASPEED SoCs support dual-boot feature for SPI Flash.
When strapped appropriately, the SoC starts wdt2 (/dev/watchdog1)
and if within a minute it is not disabled, it goes off and reboots
the SoC from an alternate SPI Flash chip by changing CS0 controls
to actually drive CS1 line.

When booted from alternate chip, in order to access the main chip
at CS0, the user must reset the appropriate bit in the watchdog
hardware. There is no interface that would allow to do that from
an embedded firmware startup script.

This commit implements support for that feature:

* Enable 'alt-boot' option for wdt2

* Enable secondary SPI flash chip

* Make it possible to get access to the primary SPI flash chip at CS0
  after booting from the alternate chip at CS1. A sysfs interface is added
  to provide an easy way for embedded firmware startup scripts to clear
  the chip select bit to gain access to the primary flash chip in order
  to allow for recovery of its contents.

Ivan Mikhaylov (4):
  vesnin: add wdt2 section with alt-boot option
  vesnin: add secondary SPI flash chip
  watchdog/aspeed: add support for dual boot
  aspeed/watchdog: Add access_cs0 option for alt-boot

 .../ABI/testing/sysfs-class-watchdog          | 34 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   | 12 ++++
 drivers/watchdog/aspeed_wdt.c                 | 65 ++++++++++++++++++-
 3 files changed, 110 insertions(+), 1 deletion(-)

-- 
2.20.1

