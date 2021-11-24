Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2801C45C7E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 15:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352655AbhKXOtI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 09:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354790AbhKXOsR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 09:48:17 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58D9C05569D;
        Wed, 24 Nov 2021 06:25:24 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso4492419ots.6;
        Wed, 24 Nov 2021 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5F5sj4/1b+BhaqAKB9fJInMpLlCSl9KUhZUokJjmkpc=;
        b=CR4v2six5AEkANEmxeYlLG2LlGbDkQDAAhnYjSmuzthlftU0Y/Yv7EKhuA6VgAb2+8
         5AD63rQ+/juycneXGNuISMnOTUTRIsldoyI06n1bQqZlso5zDzURlYoGWlKn2Bta49mU
         WwZjvNwbFzpuHoPW3CHFDxk2FhQHQlblPto5bv7z0KMNr8I/nL2jJLsrZFpmZewOJY7g
         Ytjg9AtmWvbhMkIujC0JIk48p5uddG0IoKEMo7BiK8EO1RKNKq8hybLIsBjZsFbQzNkr
         n5JDX/6Tup+LDmLvY/fQDJVEh+VX/LrRFtSfjDwU9OSzQgj1a0hKjsQo/PPz02yuJ24n
         atrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=5F5sj4/1b+BhaqAKB9fJInMpLlCSl9KUhZUokJjmkpc=;
        b=ouHUZdd5ueOx82m75K9VhvDW9PKCCXqM7EM/vwojhwreemU8WfLUIUg9UGwxW+/PTD
         UmXlpbWF2UwnDUL1cJXpSv+vAqFkcrbtxxif51kpgOjdR1ypOC99/XK6YOKSrhzagCbi
         3obXqoOyg2njvXmxNn5exTwmjcwrGih7nI3Hjr+F5PhIZVyP8HdXxcreMWAoWxfvrO11
         wQ8JIHVVR5f3OPD6h54L63BBXcr8ckVoJlUjP8iv5YD3vGvh9AehgLkqfYblDwtnjSFG
         lV7nlwsGC8QdHwXmUlTW7Q6Y0ed2KH064+RUuTGky9TB7MnEaqw9G4Nh+cAWwY7jKud1
         KHQw==
X-Gm-Message-State: AOAM532r35MBuDkbsyJJy939odRDg7vMeBdQCOE+jF0PuDz5aQ0luFuk
        ag34ulFTmaO3e02YWt3SrXU=
X-Google-Smtp-Source: ABdhPJzx7sf89K+TQKZaxJUYWW1IxL59/cS0xWqipJHJ7ue/v5DKHugLim6067vYiw/y3uZXvPyR3g==
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr13746550otd.270.1637763924260;
        Wed, 24 Nov 2021 06:25:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bh12sm5442oib.25.2021.11.24.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 06:25:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Nov 2021 06:25:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xiantao Hu <xt.hu@cqplus1.com>
Cc:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        wells.lu@sunplus.com, qinjian@cqplus1.com
Subject: Re: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Message-ID: <20211124142522.GA3939252@roeck-us.net>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
 <20211124104149.361019-2-xt.hu@cqplus1.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124104149.361019-2-xt.hu@cqplus1.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 24, 2021 at 06:41:48PM +0800, Xiantao Hu wrote:
> Sunplus SP7021 requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
> ---
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	/* The registers accessed here shared by multiple drivers. */
> +	wdt_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);

This is unusual. Why would other drivers access WDT_CTRL and WDT_CNT
registers, and how is it ensured that the other drivers do not interfer
with the accesses by this driver ?

Normally such a resource would be shared through a parent driver with
appropriate access functions to ensure that accesses are synchronized.

Thanks,
Guenter
