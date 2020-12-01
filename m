Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA0C2CB082
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 23:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgLAWz1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 17:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgLAWz1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 17:55:27 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4E8C061A47
        for <linux-watchdog@vger.kernel.org>; Tue,  1 Dec 2020 14:54:41 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f16so3330193otl.11
        for <linux-watchdog@vger.kernel.org>; Tue, 01 Dec 2020 14:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KJX3usWLk0bqM8zgqTPacJE2GQ19iICLEqmxhg0CTTE=;
        b=hzH5OxpJLa754+hYt4j3hYLTekfy6mapStW8IWnCuspVZEoaGaX6UmPs7OpJVZa6Oj
         n8LlVIGv77fY6ixGkWua7omvyVNqjsUcBjGoq/LziRpMrA7QlFWr/U5fX9zW3YhUya2H
         q3qWZO0thnu7LAXcq31HHC3f4EdcXh5hx0r1693cK2j5VGt5QbPw9/QOkiwD4J504MkD
         9XUCdQ77aoCn/fUmY9kPXHiPxOT1kAIfkwnerwZHCpS1+fL42RbixjJYWfLrQLzajAa3
         jOuXgzIcL5bSZ5UneXuAHjbTaU6Mt/YcvaKy+F+KwCNQW1zCBYNX4Z4S2hoN3CCEwYG0
         KYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=KJX3usWLk0bqM8zgqTPacJE2GQ19iICLEqmxhg0CTTE=;
        b=WcWl5NODpagRpW4FCuBrdj55o5oI8FCJz4dK8yVD7gd/fC3h57wH4OPZSd9ijsa8SC
         +bA0iR5l8iYQMGn2v0ONPo3A3EgkxoQOvQKlkj0JyAYlJ86gxJCxE5KZ9skeobpBHwaO
         DjWm0WaKytAod5ajWSfKyg7ktRxVtgXCyzCAQdwPQCJaqONsBgumqJXN0eFwnk04Akja
         Q0PkIJKCJXsGO/KJkb7I/MqtB+EoK53wDx2oTcm3Qx5WIHQ+MxCTNs/GcvzziZm99wnN
         PBgvBiXVoMVg3FgDJVQE9QeEaQoNmK6uu+nMmjAKE8JQpGB3FKJYUpKfvj7veK2nNzZF
         OBKg==
X-Gm-Message-State: AOAM5303nVhZBNplBNwwU2pRDfBHr7gZIOBN/t90WYKlc0qNogyvvb/D
        r/hSZsHmSf/46JXtl4pPHw==
X-Google-Smtp-Source: ABdhPJyCq0agyp7fHy52jjirIReN2IzV/YjI0dYMo7CpeIa/3DfWemJqQsmH+DvEJG+sIAkmo+ItlQ==
X-Received: by 2002:a05:6830:18f8:: with SMTP id d24mr3519339otf.44.1606863280743;
        Tue, 01 Dec 2020 14:54:40 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
        by smtp.gmail.com with ESMTPSA id 186sm291550oof.16.2020.12.01.14.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 14:54:39 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:80db:2555:2c37:8bc2])
        by serve.minyard.net (Postfix) with ESMTPSA id 9ABB9180576;
        Tue,  1 Dec 2020 22:54:38 +0000 (UTC)
Date:   Tue, 1 Dec 2020 16:54:37 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
Message-ID: <20201201225437.GC3110@minyard.net>
Reply-To: minyard@acm.org
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
 <20200628145420.GA80485@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628145420.GA80485@roeck-us.net>
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
> 
> Guenter

I was wondering if you had progressed with this.  I'm happy to help with
it, if there's anything I can do.

Regards,

-corey
