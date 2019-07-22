Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC987051C
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 18:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfGVQKd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 12:10:33 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:51285 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730105AbfGVQKd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 12:10:33 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id 952093A33C; Mon, 22 Jul 2019 18:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563811826;
        bh=2w36uULQBw1D8hpm6ujfWlP7s5/Zs/qUehLIqNK6p0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T2tTASwIQ7vecvWwFek3gzZD26Ip4LQWqk72I8fWY2rYMRtj4s0f9vsjx/87oG+3z
         Wmdm6jfdukNXxCrSzYBMZ4L/PheO7dt+hYEavRawux9g67+ztNHVRo32uNtqu5zjMz
         qnbnFlylEXjNYsPyENSUhcqDhZj9X3gDVD6icnaDwxvXrp7P/g6+7j1KCQ16qp4zIu
         OvT4vqAjZb38ytCutbfqgJeutYwuV81VvkHs4gcU4U2hIUFnVIEhXumEtEZT3wJgEY
         AFH6YqLI7vFM174yXZlgIwwacY8a54ZXdizzsJ5yufYmrXX2Mrj5m3GDyvPWo3Fx5m
         fXOqXpTRsvqZw==
Date:   Mon, 22 Jul 2019 18:10:26 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722154549.GA5166@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 08:45:50AM -0700, Guenter Roeck wrote:
> Weird. Is iTCO_wdt instantiated twice ?

I don't think so. I blacklisted iTCO_wdt module and rebooted but
the iTCO_wdt line in /proc/iomem still appears although the module
was not loaded.

I suspect that it might have to do with one of these modules?

drivers/platform/x86/intel_pmc_ipc.c:#define TCO_DEVICE_NAME                    "iTCO_wdt"
drivers/mfd/lpc_ich.c:  .name = "iTCO_wdt",
drivers/i2c/busses/i2c-i801.c:  pdev = platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,

-- 
Valentin
