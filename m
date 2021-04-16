Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ADD3627AB
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 20:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbhDPS0c (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Apr 2021 14:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235735AbhDPS0c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Apr 2021 14:26:32 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82180C061574;
        Fri, 16 Apr 2021 11:26:07 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id z22so9304959plo.3;
        Fri, 16 Apr 2021 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+NoMdFRqvCj0wjEu2wU+EppPHqkD5aPuBzCUVO8B5Dw=;
        b=I7NkKx+ryboIFsQYOl0hn9Owr8ah4PzLF123GS1rr/xs+Is+upY0kBQ6YKQF01qdjT
         /JXCewbuJ6m9FkA+hTJ0ZLNndSrBrcAxe1SL6n+h8Dz/6WwoLJGOl3Usr09pFM+DDcyZ
         HJpE32jNzCiYvUL/nDIlAczIlyUI4lF30PKHl8NsfqW4O8uK4lBvECjt4Wbi84sc0yUO
         TBw88FWyBysNTaVA0RWN6HfYwvdJzPzqKYBclHUW4yQSNJtWsJQzFIky0SHayASO+TKR
         MGpyBRr6Fzxc539M6xaRvLtYi/XqzOG3e21wiGh1pwMNcYgqwMmamry8dLyz86+6T+LX
         24uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+NoMdFRqvCj0wjEu2wU+EppPHqkD5aPuBzCUVO8B5Dw=;
        b=LoTDgqrTAyK5bNPRl/F+wExhYebrUbV2sTtzQfrukRsuawPR/MLzbRk3D7JP4AS+nw
         +x8tNLzF/eSNF4D9YU0KmB07Rve8zEXtNZp/BvPxFhpHv9ycGKQhwCvPYShKdVX9wu1H
         HirGBD+2ih9N+njFyNUqmr0YGL5PNPDz7vUHGF1cknfB/J1kXV5l9Z+FhAVGmUybApuE
         mtq3l9funY4xAL1hrYMChw+p77d6oo+1eYvp+++/quE6i2sA/BTCu4hluM1Koowd1yV0
         B6Y+1IXcdERfXpF59f52itO9pe6wHYdJUPtfsgYg2Y3+SLdNuD9hzKvVY43p87UDWaQm
         ou4A==
X-Gm-Message-State: AOAM530hnCBYR900onZw95Xa1b72M36gpAUtuTfYDG3c6jEYbsALwcR9
        aNGqxkg5jyAazdF6AWDWL0o=
X-Google-Smtp-Source: ABdhPJw2kWFT896TOOCfe5suf1zLJSSp2jHsX2kBjJGSkduJ7jRvKnfFRK8cKa3n/6vBVu3+CGwaVQ==
X-Received: by 2002:a17:90b:344e:: with SMTP id lj14mr11195691pjb.89.1618597567017;
        Fri, 16 Apr 2021 11:26:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id x1sm5324218pgp.24.2021.04.16.11.26.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 11:26:06 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:25:59 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH v2] watchdog: aspeed: fix integer overflow in set_timeout
 handler
Message-ID: <20210416182558.GA4816@taoren-ubuntu-R90MNF91>
References: <20210416021337.18715-1-rentao.bupt@gmail.com>
 <2771f72a-cc3c-54a5-cc2c-715ea61be6b7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2771f72a-cc3c-54a5-cc2c-715ea61be6b7@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 15, 2021 at 10:07:32PM -0700, Guenter Roeck wrote:
> On 4/15/21 7:13 PM, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> > handler to avoid potential integer overflow when the supplied timeout is
> > greater than aspeed's maximum allowed timeout (4294 seconds).
> > 
> 
> I think this is the wrong focus: What this fixes is the wrong hardware
> timeout calculation. Again, I think that the wrong calculation leads to
> the overflow should not be the focus of this patch, though it can of
> course be mentioned.
> 
> I'll leave it up to Wim to decide if he wants to apply the patch with the
> current explanation.
> 
> Thanks,
> Guenter

Sorry I didn't get your point correctly, and I guess it was because of
my lack of knowledge in timeout/max_hw_heartbeat_ms/worker (hopefully
my understanding is correct now :))

Let me drop this patch and send a new one with different subject and
description soon.


Cheers,

Tao
