Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792603717FE
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 17:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhECP3u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 11:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhECP3u (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 11:29:50 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044FCC06174A;
        Mon,  3 May 2021 08:28:57 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id i11so5729784oig.8;
        Mon, 03 May 2021 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EQFlgNNPNMaEQOqoY39I7xd7N3agfi1SCwx4TEGr+S8=;
        b=Kj7BJw5RRRnwot0GtGXlqxJXIVSYQ+nvzeF9U2gtG+3gJnwZ+NSXumXH0DsfMoVQeA
         z+LRB9PUYn95H1TPGHpeqfNH3suzqYdzO2PKpc97S6eeS2oUsYvK8QK7JpAzyb1sr1ta
         xHQsKwfEh3iVJ9rCYQ+oaMO3xnqLRffegjOE1ZOirYIg4MXn0wR3+OPqlyLPZslERxas
         L9VyAfixpi58FijhqUFwL0TiXzuTeWKnykz0k3FynpOZeQOkiW84Kc9/spoq8UHSEMx3
         zHPhgA8klXk6aGC2GDHbW9R1GOX4CjpWV1VqJWoA/Z5gBpIWKZesFYZN8C+A8KcVfUBa
         /3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=EQFlgNNPNMaEQOqoY39I7xd7N3agfi1SCwx4TEGr+S8=;
        b=aq67Q8DDkOzLx+kPOvA5VlMEW/aqhjE4jfCXL+a7FF80JuGagnGfFsytpTzVDiV/Px
         n6UMYXuNbuADNvzuM1uFqr4exhJI74rpOFFjEzdu6q7a7H1u7TrPVinzSE7+LIKPUdve
         5L5kRoQRTBbQNNBmLz+2IuSF6L5+q0wLN6GwuMfwMh3rFDZW7Wjhhx4LtGp5XUv+t3vo
         y0dMavxzFGe1GmOU6DUcKN/L9cDmjZhlH2on6fsg78BAYXmSCTNincC5WNYxHddpeBvE
         xD4BhSkFQYv6n21UgOxuAqG5dBjbb5S6MsBJTF7aijkeWXVNuEgqt/6aWDi7b2E/zkqW
         4ewg==
X-Gm-Message-State: AOAM533XaPNvVN7BFuqCpKaoCs3AjbxgzmWeklWPbgRg77sihVvDqp4a
        s2d+ycy0AWO71CZJczd0jeoR//NPFs0=
X-Google-Smtp-Source: ABdhPJwHuTdglrJvu26yvYe1/hy3KQzBUr9UjLQPzXyyaQyQJIl/SjMbrPBEoI680la8ZYiwBQjP2Q==
X-Received: by 2002:aca:b387:: with SMTP id c129mr20722309oif.30.1620055736448;
        Mon, 03 May 2021 08:28:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l7sm12821oov.5.2021.05.03.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 08:28:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 3 May 2021 08:28:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 2/3] watchdog: f71808e_wdt: migrate to new
 kernel watchdog API
Message-ID: <20210503152854.GA624769@roeck-us.net>
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
 <35b474fa750fa11781509e94675fc90e28b2d514.1618310618.git-series.a.fatoum@pengutronix.de>
 <92b48338-4d9a-dc02-d8b5-198bd34c9f21@roeck-us.net>
 <9f326f40-08dd-ab2b-0a80-970d20c57d6a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f326f40-08dd-ab2b-0a80-970d20c57d6a@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 03, 2021 at 04:39:25PM +0200, Ahmad Fatoum wrote:
> Hello Guenter,
> 
> On 03.05.21 16:31, Guenter Roeck wrote:
> >> -static struct fintek_wdt watchdog = {
> >> -	.lock = __MUTEX_INITIALIZER(watchdog.lock),
> >> -};
> >> +static struct fintek_wdt watchdog;
> > 
> > This should really be allocated, and "watchdog" is a terrible variable name
> > even if static, especially given the previous patch.
> 
> I can add a follow up patch to change this. I maintained the old
> state of things here to make review easier.
> 
Odd argument. You changed all the function names (unnecessarily,
if you ask me) in the first patch of the series because they were
too generic in your opinion. That by itself added a lot of unnecessary
complexity to the review. And pretty much everything else changed
in this patch anyway.

Guenter
