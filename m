Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B9020C968
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Jun 2020 19:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgF1R43 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 28 Jun 2020 13:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgF1R43 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 28 Jun 2020 13:56:29 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492B5C03E979
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Jun 2020 10:56:29 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 12so6061281oir.4
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Jun 2020 10:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SWaV4KuGDDlEwRWPYnhRmMQ0ubicOGjf8DiR5GbPBMo=;
        b=MsGkyI7psj++zGl+x/DpidrjmZVuEt4uFPcRAphgKwhxcYwurEYsGIq8UKbNKwhH3S
         hxp29LHsAxthrfgbmfelZ6BwBCkj7JHg4domLUSNwf7cdp5O5M/S7efVvJDvOrI4vkFw
         EcMAG6l1s9Wla5T/WXqWGNtQcFfR7FuGIyJGkPPwsiaGMV/e8jxTIN9gakOwaXiQxuZ/
         8vKnChspqkVsVOm9mn/rim1vdzpdIGiFB7vo503TveqnCf/MwM39ElTzGfOzmbDf+5gC
         hk1b9DZgCFzQDd4ms1aZRf3zYs1ql7UiYhSRpmo8+4p2nnksbV2dMx2X6KXfbIql7VYx
         bSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=SWaV4KuGDDlEwRWPYnhRmMQ0ubicOGjf8DiR5GbPBMo=;
        b=G3Qgha5leiPc4QELgRT+apupDoK35t+TjRDxRWMJaS/O8WEgI37bDFjsEFiVPDE8dB
         +geiiDIx5n5hM96kh1dKqREaFIFi8V/xsyNf3iiDf0hyDUsdLHBGEWNZQcDMdUral76M
         EvAHCPV/16VbZPIMvsr4X1gjYnJFl+pK8i/caCeYt9Ci94pIocFYwO3SLuWtfhSFIuwb
         8MPzvkOFfIDHnPIopQjS0DToeg/WGNGcC0+azCpfXGf4bpGErv1eol+l7SYTUszEbIuO
         9c0CqW0+hJubWIRQ8XXlzlSowdZZO4ciwVWWTFOIJSSKvdiAra+a3yL2WFLf07rGllb/
         1nwA==
X-Gm-Message-State: AOAM531g+ON+fQadbDCp8qh3dZ9/su3cW4jN9dXuQh3V/pmW+d2KOqGT
        6TBc+or9foMsGoodgtsxRg==
X-Google-Smtp-Source: ABdhPJwhK8sKUWEtkv4bFQV+ufiK2kazkcAi9ehV6ORqzA3QQ0yN9AlchDHoe7HCWQUTzCI6cgeXZQ==
X-Received: by 2002:aca:d497:: with SMTP id l145mr1285972oig.146.1593366988502;
        Sun, 28 Jun 2020 10:56:28 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id a10sm8035376ooo.39.2020.06.28.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 10:56:27 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:cd50:aae4:8bae:755])
        by serve.minyard.net (Postfix) with ESMTPSA id 2601818003B;
        Sun, 28 Jun 2020 17:56:24 +0000 (UTC)
Date:   Sun, 28 Jun 2020 12:56:22 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
Message-ID: <20200628175622.GM3235@minyard.net>
Reply-To: minyard@acm.org
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
 <20200628145420.GA80485@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628145420.GA80485@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jun 28, 2020 at 07:54:20AM -0700, Guenter Roeck wrote:
> On Sat, Jun 20, 2020 at 12:33:46PM -0500, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
> > structure are expected to be in milliseconds.  Add the flag and the
> > various conversions.  This should have no effect on existing drivers.
> > 
> 
> I have decided to go another route: Instead of using a WDIOF_MSECTIMER
> flag, provide new callback functions. That increases structure sizes,
> but ultimately I think it is cleaner.
> 
> I implemented a prototype, but didn't have a chance to test it yet.

Oh, ok.  I was looking at going through all the existing drivers and
changing the direct references to timeout and pretimeout to use accessor
functions.  That what what I thought you were hinting at, and I thought
that was a good plan.  My original idea was to provide the ability,
change everything over, then remove the messy cruft from the core
driver.

If you want to send something, I can try it out.

-corey

> 
> Guenter
