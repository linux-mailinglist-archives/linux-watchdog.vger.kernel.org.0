Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC804DB03
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 22:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfFTUOx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 16:14:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33419 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfFTUOx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 16:14:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id m4so1543445pgk.0
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Jun 2019 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V2CA6K56D1mC7bw0XsvYv7mE61/Fy7AmS44Yva8Ndho=;
        b=nS7ak3lnYGTCxs4ArN0UvKg+uEGzoRv/r9VC0m+gvLmgaW32RWDQS76ehooIhXb6Er
         Lq+qXuy4u5fCNEoUi9OrUBw259XMW8ZBZUOGbyMLIGmlyaLmhQMdP7Kjyk++Hnz6DkJP
         k0L9ZmNa0bM5MUVdMQ552XEIczLP5y4rmy+YSkDhNgVdW/czkOrh2VVLHVsbXJgWgF/5
         VO43lIKNs8Rbh0cvBy+qbEcA2YiFATogdsWJDOXQekdlG2z/9Id8rqLRgbu4OGPNQM4Z
         bWXAQC4ev7SDdeYLur7CB1x6SIm7158wslwKLFa30Y0+99GVIsnaviVdYvFJTGxgNrhh
         y8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=V2CA6K56D1mC7bw0XsvYv7mE61/Fy7AmS44Yva8Ndho=;
        b=FKx9ZuREry7bkqfpemgOlN5GZapcHNqm9BIy4+lFkqnKnvICx1UCzSE52Y1HAiKQBg
         QZa9yjJ+aIn7NOabY2D0E9BnHc4cVzXEMFXVuQWoHkg7QbXt5TABqieC0vN8fTGBNnTA
         kKtn59/jXFuRop0t9jybJhFg9JCfvhU2eu0qIWOtGKpcu8UyvowmlB1qr48yd7R4181/
         yEGu148Z7sH5Fq4zUypW7SjvfQkdzwqAsKcm1fqO7eAGyzwOiWw2pYHcqCou32zwbjr2
         ijLh5cVMjPpUOMTtFeGTFdeNKYFR9eDAoSh41jRNftbCB8BU8ZRgb2E7A+CBiFUg+hlb
         CFjQ==
X-Gm-Message-State: APjAAAXPb5CHeZOxV+tI4kd3GHEpgG8A8jOuIsUgkoz8+P27puuv1LAE
        lX9ieRPNQdJ5aYAj+CCFajq8h6t0
X-Google-Smtp-Source: APXvYqw2OxuSJC9oQWReunz86mO7Sxb6mR49+PB0tXH7BTE8GujHRUe11SK3Yofdnb6xoLDQFcRHOw==
X-Received: by 2002:a62:e301:: with SMTP id g1mr34304669pfh.119.1561061692664;
        Thu, 20 Jun 2019 13:14:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z74sm438516pgz.41.2019.06.20.13.14.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 13:14:51 -0700 (PDT)
Date:   Thu, 20 Jun 2019 13:14:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Paul Cercueil <paul@crapouillou.net>, kbuild-all@01.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [hwmon:watchdog-next 57/71]
 jz4740_wdt.c:(.text.jz4740_wdt_stop+0x28): undefined reference to
 `jz4740_timer_disable_watchdog'
Message-ID: <20190620201450.GA31493@roeck-us.net>
References: <201906210410.0uMwILcJ%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201906210410.0uMwILcJ%lkp@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 21, 2019 at 04:08:11AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
> head:   ae399280879b77d63433860b54e00fdf8212df21
> commit: b0225022beeb34df00bbf0eea25a2ed537629ac2 [57/71] watchdog: jz4740: Drop dependency on MACH_JZ47xx
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout b0225022beeb34df00bbf0eea25a2ed537629ac2
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/watchdog/jz4740_wdt.o: In function `jz4740_wdt_stop':
> >> jz4740_wdt.c:(.text.jz4740_wdt_stop+0x28): undefined reference to `jz4740_timer_disable_watchdog'
>    drivers/watchdog/jz4740_wdt.o: In function `jz4740_wdt_start':
> >> jz4740_wdt.c:(.text.jz4740_wdt_start+0x3c): undefined reference to `jz4740_timer_enable_watchdog'
> 

Looks like dropping that dependency was a bit premature.
I'll drop that patch from my queue for now.

Guenter
