Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3110032216D
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 22:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhBVVb1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 16:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhBVVb0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 16:31:26 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC07CC06174A;
        Mon, 22 Feb 2021 13:30:45 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id w69so5817766oif.1;
        Mon, 22 Feb 2021 13:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mEwxSti7BFekg/Ekh1GU2sxr5v/xIGx+ndLqC9kVH28=;
        b=mxRMFdM4PzeO3P1+snD3XWKiKxVfKaKisyMj8EPTAAaus3LmP875OqZlTm1qWRWpsl
         bkjQf0TzOpdpBhquQVHNLQTedxQHc4D5tUsSqIN6niR2Mce2kmnK88l8FMWkhNZbAF7w
         tmcpoTXDb0TaWX8S9GIh/YL25ZZoHG20+hZ9BE+AvbmH7vnnj6wa/ETIUsqX+hgv18/V
         x9+im/+wNn9MqqubWLYK1dVY2CJhLT7sv9fKcb9Z9ymxytdid3nGE5aZMpDjYAucXy+z
         Uitw4A+LehiuwHh9KRPtjxx9VmFBoYUVvSlLDyTk8vo98mxnzz4FS+0wSFi5FPzEV1Lj
         OIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEwxSti7BFekg/Ekh1GU2sxr5v/xIGx+ndLqC9kVH28=;
        b=MS4c9761BkbbQ2heKfkrqg7+BZz3zqPT8rwjcn3Y5+4I6sbgLK3o+PJQ4qrw4KQJjt
         qNoVUxcVz2tmtWkegZ7jJUsNlU3PsSnQOix8wgkU6Il+oqz1uYPkCL6wsLOz4OH985ZQ
         Vvv6XCRQj5dnqhbRYLIZNUp2f3G+MRd/SAFMoDzl2dC/WGxUzUjL2ijQvI3uMfXSLb6Q
         NJoyffdQc4yhKS1mFrVGrbHjIiIFksq4gZ6Y764gfusd+uVQ33A8hjK8+eUt7GlrCfCB
         s7IRvwHhxSp3vKj5ZWXsxh2OCy3x3/ZVgrw1ZqS65ZSl9sWgafUMECOuLT9XpTWy6ls4
         yYnw==
X-Gm-Message-State: AOAM530s62Wjnu9nbWAhuZorMw/OIXFs0rOxozNpCUEVJeB/gRLHkW1W
        rb42czKpKawsK0Qilk+DFwM=
X-Google-Smtp-Source: ABdhPJzemMbkkuynXP537mWDmvk02m0bIk1EddBHBhwftMVLE/TVyHXbQ4++OLA1sb5QjK7IvOUW7g==
X-Received: by 2002:aca:57d3:: with SMTP id l202mr8390653oib.97.1614029445490;
        Mon, 22 Feb 2021 13:30:45 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t4sm3769637ooh.4.2021.02.22.13.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 13:30:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 22 Feb 2021 13:30:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: R: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Message-ID: <20210222213042.GH98612@roeck-us.net>
References: <20210218163200.1154812-1-f.suligoi@asem.it>
 <20210219105447.GI2542@lahna.fi.intel.com>
 <bf4e89bd11964f2e9f621f949adc338b@asem.it>
 <4ed7ec8c-d5bf-41b8-96c4-b34db670315d@roeck-us.net>
 <90ae006f2f3a47298122d53ba5e747b3@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ae006f2f3a47298122d53ba5e747b3@asem.it>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 22, 2021 at 11:28:18AM +0000, Flavio Suligoi wrote:
[ ... ]
> > Having said that, I'd prefer to have a module parameter in the watchdog
> > core. We already have a number of similar module parameters in various
> > drivers, all named differently, and I'd rather not have more.
> 
> Ok, I'll study how to introduce a this new parameter in the wdog core,
> so that it can be available for all watchdog drivers.
> Then we'll have to think what to do with the existent similar parameters.
> I think we have to keep them for compatibility reasons.
> 

Correct.

Thanks,
Guenter
