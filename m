Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A59034060E
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Mar 2021 13:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhCRMuR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Mar 2021 08:50:17 -0400
Received: from mail.thorsis.com ([92.198.35.195]:59520 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230408AbhCRMuH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Mar 2021 08:50:07 -0400
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 08:50:07 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id DD7991C61;
        Thu, 18 Mar 2021 13:41:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WqZl_3cqu2bQ; Thu, 18 Mar 2021 13:41:07 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id AFA98282A; Thu, 18 Mar 2021 13:41:07 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
Date:   Thu, 18 Mar 2021 13:40:58 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Message-ID: <1819093001.11427.1616071258857@seven.thorsis.com>
In-Reply-To: <e2c6bec5-1f8e-c69a-9219-5c0a9f63ba56@metux.net>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-3-henning.schild@siemens.com>
 <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
 <e2c6bec5-1f8e-c69a-9219-5c0a9f63ba56@metux.net>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hei hei,

> Enrico Weigelt, metux IT consult <lkml@metux.net> hat am 18.03.2021 11:27 geschrieben:
> 
>  
> On 15.03.21 11:48, Andy Shevchenko wrote:
> 
> Hi,
> 
> > I have a question, why we can't provide a GPIO driver which is already
> > in the kernel and, with use of the patch series I sent, to convert
> > this all magic to GPIO LEDs as it's done for all normal cases?
> 
> Do we alread have a generic led driver that for cases that just
> set/clear bits in some mem/io location ? If not, that would be really
> great to have.

Yes, there is. Look out for compatible "register-bit-led" in device tree. That's from driver in drivers/leds/leds-syscon.c and you can use it inside a syscon node in dts.

It assumes one bit per LED.

Greets
Alex
