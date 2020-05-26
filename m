Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86091E236F
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 May 2020 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgEZNyY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 May 2020 09:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgEZNyY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 May 2020 09:54:24 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9009AC03E96D;
        Tue, 26 May 2020 06:54:23 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t8so1368019pju.3;
        Tue, 26 May 2020 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZkVKV2UH/eWvLbkE4SW9kgvEsO5RkJGpATRi0sdomAE=;
        b=Ya783eH2nqFGoCATcI3/aVBaz5YMlyLVtXNwQKv4SbAb79lWOuBCJXr9hq7++1gfnk
         WTr65POwRa8F4+qjJT8DTvfhs6nvqFARCrE5eFukGrkh+2GM9wCXdByfA/G65k0iR/rd
         tYRuW1hcq8RWjnJ0voJ0ja4QdVi+JwuvHWQhuk+4fCqlO3qLe6uXQz8wEtJanGIv8p3i
         NuntsL7Fiv4iZGnHAoz9q88qYU+hmaBeBG6bKrSznEvhXmMttm/WN/ulBf4SvIOWqAH+
         coKdHbG3j8WP5+/IBWLm82LVhRF35sEG3EGMSmboueQHxSJCLQesJVQOS4KzanILBOdR
         uPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZkVKV2UH/eWvLbkE4SW9kgvEsO5RkJGpATRi0sdomAE=;
        b=dM8dqyyPOkPw257yeAuYEqxOD51eBFsh9pLVRx3sRGP7/qNND/xYtLor1p9CDkY7uC
         j4Ph66JF3/L6Z0dnUGnzNv1kMoKIRsOWYdmFGGcOuHoWOvDPUD62HMVJNlSZvyb05S3T
         jc2OvL4zCuF6j7SucPpbxrYgOttc0BAe4z9CAnKJD88kvpOdSssmacc53u81ZOK/xXPa
         Qh+stM66GYpd8W0zBL2Dc1EJ4W+dmfb7WEv4ovMh+BmqZ6RMS6WNjeho48YwijilsHRf
         3tKWZg8TIj4OD2fLeVemER9zb7Rwy73jooVON8pWhMJKfDDKhmJVjDiFTZRqGZ13pEJ+
         qkTQ==
X-Gm-Message-State: AOAM532/nb2xizJDNV3hcxOiXVQfPWQnb6PZzuGugveS7kDvsQMO5S/h
        fK8G9bkCaB2/LyWNDIaovsRV24JB
X-Google-Smtp-Source: ABdhPJzYvnKwagq+l2qllbYDUBjIFSq3XZyryPSx45eSR3T6IH48O+w7cMc7nk07Nv8TygUthmrKFA==
X-Received: by 2002:a17:90a:aa8d:: with SMTP id l13mr27503913pjq.92.1590501263025;
        Tue, 26 May 2020 06:54:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w190sm15134657pfw.35.2020.05.26.06.54.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 06:54:22 -0700 (PDT)
Date:   Tue, 26 May 2020 06:54:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        it+linux-watchdog@molgen.mpg.de
Subject: Re: watchdog: iTCO_wdt: cannot register miscdev on minor=130
 (err=-16).
Message-ID: <20200526135421.GB51584@roeck-us.net>
References: <a6e0f876-3a0f-49fd-7f45-715e75b6a779@molgen.mpg.de>
 <95b7828b-2de2-6c29-f51d-c6d22b59d014@roeck-us.net>
 <843f5c26-82ac-3553-7d98-3cbe3068cc99@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <843f5c26-82ac-3553-7d98-3cbe3068cc99@molgen.mpg.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Paul,

On Tue, May 26, 2020 at 01:54:40PM +0200, Paul Menzel wrote:
[ ... ]

> 
> I wonder if the error message could be made extended.
> 
Question is what to extend it to. Best we could do would be to report that
the driver will still try to install itself. Since the legacy driver doesn't
use the watchdog infrastructure, the watchdog infrastructure knows nothing
about it, and it can only guess the reason why /dev/watchdog is not
available.

Personally I'd rather see the ipmi watchdog driver to be converted to use
the watchdog subsystem, but that is a bit unlikely to happen.

> > made the default.
> 
> > You might have some other log messages indicating which other watchdog
> > is installed. Otherwise you might need to use ioctls on /dev/watchdog
> > to determine its name. 'lsmod' might also be useful.
> 
> Please find the logs and lsmod output attached. It might be created by the
> IPMI driver.
> 
> ```
> handsomejack:~$ dmesg | grep IPMI
> [    9.890808] IPMI message handler: version 39.2
> [    9.900456] ipmi_si: IPMI System Interface driver
> [   10.080438] ipmi_si dmi-ipmi-si.0: IPMI message handler: Found new BMC
> (man_id: 0x0002a2, prod_id: 0x0100, dev_id: 0x20)
> [   10.113076] ipmi_si dmi-ipmi-si.0: IPMI kcs interface initialized
> [   10.121572] IPMI Watchdog: driver initialized

Yes, that is indeed the case. If you don't want it, you could maybe
blacklist it. Unfortunately it looks like it is built into the kernel,
so you would also have to change your kernel configuration to
CONFIG_IPMI_WATCHDOG=m. Alternatively, you could keep it and just use
/dev/watchdog1. Either case, you should make make sure that it works.

Guenter
