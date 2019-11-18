Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86815100789
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 15:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKROik (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 09:38:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:53026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbfKROik (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 09:38:40 -0500
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB1C520722;
        Mon, 18 Nov 2019 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574087920;
        bh=pDbZZFBRuT+/rAkFJ1NgB+aE0qqXz3ohzREEsGA/6t4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=YFaGySRza7AJTQ53tP9rwaD5VnUKSxC8dCfzCPNugLdDkuVbNf1BwgXDPCmfjZAJe
         nMM8xll7VJDTHQJwPIfwV6sKXqHdr704vDxWuNH9YiNfNYRXMoRX1qa/yJvO4Nd3QA
         OJgsQUhFvuRek6dckdBK2UGXID/HVz7NjfA4pQVQ=
Date:   Mon, 18 Nov 2019 08:38:38 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Subject: Re: watchdog: how to enable?
Message-ID: <20191118143838.GA29359@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+h6SuGKWn0qNqsCdNjDks_vHuJW-KfiQja_b3x8x=vq_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

[-cc linux-pci (nothing here is PCI-specific)]

On Sat, Nov 16, 2019 at 06:05:05AM +0530, Muni Sekhar wrote:
> My kernel is built with the following options:
> 
> $ cat /boot/config-5.0.1 | grep NO_HZ
> CONFIG_NO_HZ_COMMON=y
> CONFIG_NO_HZ_IDLE=y
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=y
> CONFIG_RCU_FAST_NO_HZ=y
> 
> I booted with watchdog enabled(nmi_watchdog=1) as given below:
> 
> BOOT_IMAGE=/boot/vmlinuz-5.0.1
> root=UUID=f65454ae-3f1d-4b9e-b4be-74a29becbe1e ro debug
> ignore_loglevel console=ttyUSB0,115200 console=tty0 console=tty1
> console=ttyS2,115200 memmap=1M!1023M nmi_watchdog=1
> crashkernel=384M-:128M
> 
> When the system is frozen or the kernel is locked up(I noticed that in
> this state kernel is not responding for ALT-SysRq-<command key>) but
> watchdog is not triggered. So I want to understand how to enable the
> watchdog timer and how to verify the basic watchdog functionality
> behavior?

I don't know much about the watchdog, but I assume you've found these
already?

  Documentation/admin-guide/lockup-watchdogs.rst
  Documentation/admin-guide/sysctl/kernel.rst

Do you have CONFIG_HAVE_NMI_WATCHDOG=y?  (See arch/Kconfig)
