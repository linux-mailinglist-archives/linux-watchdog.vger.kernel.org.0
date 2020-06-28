Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F3D20C899
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Jun 2020 16:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgF1OyX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 28 Jun 2020 10:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgF1OyW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 28 Jun 2020 10:54:22 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD26C03E979
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Jun 2020 07:54:22 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f2so6100603plr.8
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Jun 2020 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oe/lKHfFJ3C6dfwkrXV5swYGCPIHIy7oPbA0yIEM0iI=;
        b=rmsxPH3WoE6GOtmTsKyY/XL7fF4IkuVRtW2zU/FcUX2dI1h9IYZaTpmkV6Zv/+Bdf1
         S6aJ+Yi8oRISAl2IbTV8RR32WbDYTC8KNlJlzQbPnOp3BgjRCsrk4rOmuSXuq4uivdwm
         FwATat+wIY4OfyPyVHZYpa/lunQ/a7oLT3JSOK0UZ3C2WHawYnsncOXRGQQAEkIRcLDC
         QHLGCvITVwKxgdheGT97bKI8X/C8mTFtx0u2743hL7Ph0MAUUmm6qb5bxTQ0Hu9M61xa
         z+vrP+hjCkq4nnk9aLGM632MBP17yq2a1e1PimDw+/KaHJ52B+iumC9HyAqcy7fgpMxm
         0+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oe/lKHfFJ3C6dfwkrXV5swYGCPIHIy7oPbA0yIEM0iI=;
        b=MnKjXqEa0aMiNC8hjiEgG54Q5YvW6XqY6DPQIcKxZWBHr8OxPir6tDko9a1psozwkP
         l0Yj6ILZ6a7IlsRnRo3Q36iIEjzVBiBWeM/AWQzzDhURJOlYEqij2+vsHPktudtWvyG9
         A80MkfxOJb/aoa1bubXOtXGKCNo7cMiRdVZzJ77xIPNU3c0NkTOf3/2eyyVz6Z3pwqQQ
         5a7ZhWrYzjSHokCEwA1x8mJ6sU9gBbTW2G4k5m29ubRpggn85Uv8MdbXYSzFJNl+hEEN
         lrNhD9AYhnLr6xVyVMephvDKw2VcRFfTFRmojIKi2TFLw1GYTEhFyhTiV2Nfbk/as55E
         0DAg==
X-Gm-Message-State: AOAM531QJFca4ECN/9YNk1TgJ9Z+w2ajaiD2234IIZngJpmbD2xtuSuD
        1du6fGgifwL/d4wA7XhBVMs=
X-Google-Smtp-Source: ABdhPJymvmXV/I0vwCxDy13d5T/b26Ayix3XRAowGKDHRjbiyL/6iAr0D4//ZwoYDk14rO9tQJmz9Q==
X-Received: by 2002:a17:902:c181:: with SMTP id d1mr9019886pld.176.1593356062195;
        Sun, 28 Jun 2020 07:54:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 81sm1932805pfz.55.2020.06.28.07.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:54:21 -0700 (PDT)
Date:   Sun, 28 Jun 2020 07:54:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
Message-ID: <20200628145420.GA80485@roeck-us.net>
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620173351.18752-2-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:33:46PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
> structure are expected to be in milliseconds.  Add the flag and the
> various conversions.  This should have no effect on existing drivers.
> 

I have decided to go another route: Instead of using a WDIOF_MSECTIMER
flag, provide new callback functions. That increases structure sizes,
but ultimately I think it is cleaner.

I implemented a prototype, but didn't have a chance to test it yet.

Guenter
