Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8593017A7
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbhAWSfS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWSfR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:35:17 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DB7C06174A;
        Sat, 23 Jan 2021 10:34:37 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id w124so10067186oia.6;
        Sat, 23 Jan 2021 10:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WvGvhBvwh8qG5GQxuJx70Sl4ah/2uU9t+wVzyfMB7Wo=;
        b=AcNjin+0tIFvm5mj4s3x5wb4SXd5yE6LCrdB+80DfWqs7swQCvkh/FJBDN9uzK9M5x
         Mb5VL0CDBGDA2uBd54Mtzbm1pr10v/mbi4moQyUFLleZYiqe3SxHFTGTAFMG9giC6RM/
         HEgV6q30egjkrOjxnOysGb0QcJwiwGYsQcv3zck+3grgzplpWrOERgYJmJXGywWnTdtz
         FHiIrkkUSXxqGOwQkBcYC5ePYQBqw3TVZME3wDbtU/oJZ3bgq6DoaiJbaZl/67HIatJV
         v0zIoLnYtIyHLdNoVsTUuuxB3CCyUMz+MHgqYMQrviwwPAXvIXmEd0trjo7kaPt8A1e7
         DWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WvGvhBvwh8qG5GQxuJx70Sl4ah/2uU9t+wVzyfMB7Wo=;
        b=Pka1+n9Nb6swSEBZCMYk5gfDWCD4Mzo2VOuQKS7jprLyn/Gn07nZesjR4+Qdd15G3v
         Z/vGAaO14TvfkwRhsnmkiZDDsFqizul0aCoPMceyio9IlN+TC2PJt5eWBUZvL+IBvGKs
         TWufk6JDNzmSdS4jXrYQzoCX5oA2mfNpP2qU5mDnaBgIQo3YG+DZ+H0inLuS08SoDxwA
         GSJC/2FFJj4nly+ca2Xik34Xb3YgyJyDyhNKhXb4PLsjRCkyTjKaq2TveG285IU2x8cf
         z8nYvKFaKTp8Z2PpOc3meoVyehbPYZTz8Ftx5SSuQYGTOjN3/yLC7/L0EPWSKgRSZwsE
         nGLA==
X-Gm-Message-State: AOAM5322u1cGT63NyehXQz0sybvDWQRob409PkGq7TTNmzkV3st0Y3wi
        +wfBh1Van+O6L9cohnx7W0Q=
X-Google-Smtp-Source: ABdhPJyH0aHcM2/rCSjwmNQIZ29dh7mAmOKRm4YCFlj7recbibX5vCqn68Ck/X+eWpMYLUUrYo87kg==
X-Received: by 2002:aca:72ce:: with SMTP id p197mr7021116oic.173.1611426876707;
        Sat, 23 Jan 2021 10:34:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q6sm2436605otm.68.2021.01.23.10.34.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 10:34:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 10:34:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH 4/5] watchdog: remove tango driver
Message-ID: <20210123183434.GA60725@roeck-us.net>
References: <20210120162745.61268-1-arnd@kernel.org>
 <20210120162745.61268-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120162745.61268-5-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 05:27:44PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The tango platform is getting removed, so the driver is no
> longer needed.
> 
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Mans Rullgard <mans@mansr.com>

I ueued this patch up in my watchdog-next tree, and while doing so
removed the devicetree bindings as well. If Wim picks up the patch
from my tree we should be fine; otherwise I'd suggest to submit a
follow-up patch after v5.11 to remove the bindings file.

Guenter
