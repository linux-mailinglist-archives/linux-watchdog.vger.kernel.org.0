Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC2A9AB59
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Aug 2019 11:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfHWJbJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Aug 2019 05:31:09 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:52434 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726956AbfHWJbJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Aug 2019 05:31:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 1912A42ED0;
        Fri, 23 Aug 2019 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1566552667;
         x=1568367068; bh=pOc3KLiQCgqwQcr8n6hsHD5m1EFrOU7bcNFQtatabT8=; b=
        XFGFXjhvly2dvECGwAtaNq2hu4GomB0gNYXEl8WFxz/2uBQ2dw7AIS7yfQFKjSO4
        Q4D2fVhENmP25ABODLTd/K6gIRb5pu8aSwZPaL92PSsgOeVpxJpDqO/mOAvyZbl8
        +A7YIHFayyiFTEFO8EFo4Ce4lIyWMjiV4WOT4VBPFqw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BK7UGQ-a1HdK; Fri, 23 Aug 2019 12:31:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id EB8E842ED6;
        Fri, 23 Aug 2019 12:31:04 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 23 Aug 2019 12:31:04 +0300
Message-ID: <b79f8d93f67998783c4fd937eac1a488a46c2c9e.camel@yadro.com>
Subject: [PATCH v1 0/3] add dual-boot support
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>,
        <openbmc@lists.ozlabs.org>
Date:   Fri, 23 Aug 2019 12:31:03 +0300
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

Ivan Mikhaylov (3):
  vesnin: add wdt2 section with alt-boot option
  vesnin: add secondary SPI flash chip
  watchdog/aspeed: add support for dual boot

 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 12 +++++++++
 drivers/watchdog/aspeed_wdt.c               | 30 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.20.1


