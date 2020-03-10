Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E742317ED52
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Mar 2020 01:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgCJAdi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 Mar 2020 20:33:38 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:44470 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgCJAdi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 Mar 2020 20:33:38 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9DDE880307C8;
        Tue, 10 Mar 2020 00:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1ZkS3tMholhH; Tue, 10 Mar 2020 03:33:34 +0300 (MSK)
Date:   Tue, 10 Mar 2020 03:32:44 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] watchdog: dw_wdt: Take Baikal-T1 DW WDT
 peculiarities into account
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200310003335.9DDE880307C8@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 06, 2020 at 04:27:40PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> There were a few features enabled at the time of the Baikal-T1 SoC DW WDT
> IP synthesis, which weren't taken into account in the DW WDT driver available
> in the kernel. First of all the SoC engineers synthesized the watchdog core
> with WDT_USE_FIX_TOP set to false (don't really know why, but they did).
> Due to this the timer reset values weren't fixed as the driver expected
> but were initialized with a pre-defined values selected by the engineers.
> Secondly the driver expected that the watchdog APB bus and the timer had
> synchronous reference clocks, while Baikal-T1 SoC DW WDT was created with
> asynchronous ones. So the driver should enable two clock devices: APB bus
> clocks and a separate timer reference clock. Finally DW Watchdog Timer is
> capable of generating a pre-timeout interrupt if corresponding config is
> enabled. The problem was that the pre-timeout IRQ happens when the set
> timeout elapses, while the actual WDT expiration and subsequent reboot take
> place in the next timeout. This makes the pre-timeout functionality
> implementation a bit tricky, since in this case we would have to find a
> WDT timeout twice smaller the requested timeout. All of the changes described
> above are provided by the patches in this patchset.
> 
> In addition traditionally we replaced the legacy plain text-based dt-binding
> file with yaml-based one, made some cleanups in the watchdog core code (just
> replaced time-unit numerical literals with corresponding macro) and added
> DebugFS nodes to ease the driver debug procedure.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> commit 98d54f81e36b ("Linux 5.6-rc4").
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (7):
>   dt-bindings: watchdog: dw-wdt: Replace legacy bindings file with
>     YAML-based one
>   dt-bindings: watchdog: dw-wdt: Add watchdog TOPs array property
>   watchdog: watchdog_dev: Use generic msec-per-sec macro
>   watchdog: dw_wdt: Support devices with non-fixed TOP values
>   watchdog: dw_wdt: Support devices with asynch clocks
>   watchdog: dw_wdt: Add pre-timeouts support
>   watchdog: dw_wdt: Add DebugFS files
> 
>  .../devicetree/bindings/watchdog/dw_wdt.txt   |  24 -
>  .../bindings/watchdog/snps,dw-wdt.yaml        |  96 ++++
>  drivers/watchdog/dw_wdt.c                     | 460 ++++++++++++++++--
>  drivers/watchdog/watchdog_dev.c               |   4 +-
>  4 files changed, 523 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 
> -- 
> 2.25.1
> 

Folks,

It appears our corporate email server changes the Message-Id field of 
messages passing through it. Due to that the emails threading gets to be
broken. I'll resubmit the properly structured v2 patchset as soon as our
system administrator fixes the problem and all the questions, already raised by
the maintainers/reviewer, are settled. Sorry for the inconvenience caused me.

Regards,
-Sergey
