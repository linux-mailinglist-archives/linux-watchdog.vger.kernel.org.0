Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683FC3A4040
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 12:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhFKKgo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 06:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhFKKgn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 06:36:43 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5098C061574;
        Fri, 11 Jun 2021 03:34:29 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so2689507otk.5;
        Fri, 11 Jun 2021 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Pu5Bpf2F/UJvF9uKJ3m2aKujMucNH5SJI5mlJyuB9Q=;
        b=QPp+Grb1CyKMSGCHFxei6cYRmVlOBshR9pCDzK4iT0gjoEpnvQUc+Z/HhfvmCm9/V4
         SmbYieHf0KRT/dZi8Q0X84sUBzSm/Q3aURO2i+7BeZt+Z8rXeNGoj04Jg6bqbxna6bPK
         oeEPJX1onVWJUErXfB5qS1wlaNvRGRHZEoAXxx4+axvdr4sfY5Dgm+T/CUH98xDES0E6
         IgQS/rG80lnixFSB5aRy86yAL+NrbjcauEXrSFBrEsRfmjngsS2im6dNxynhV0iUdzzK
         OS8ysVKKOnSJX0d1QbQS1lFAYdb/6U4KYrqlXg2YfFppTO6mRYEn5dPuxDfK3zPqHRl9
         RFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4Pu5Bpf2F/UJvF9uKJ3m2aKujMucNH5SJI5mlJyuB9Q=;
        b=l0+xNwjo8v9UFK3Ocy4cT0B1PsqNTJsOPNWsR+JEQDs6cfF2XcwgUOZtfXDiCN7FxV
         QHmiy2jM+wdIPPDS+st75vx+nKWsJNbUjF2JoSdf5kzmaqLqCZ66EEu7X+sg9ZUjSj3h
         +UW2TuN+be8F8ntxXi8I/JQm2gzc/nIN0qQ+nfVtq4wgsWRRIIQ5E84vA03ZKbsf0Yzc
         xf8vA/HGgvCn9wCVUdsTeQtVL2hGehEpjk+vy9TuBMp+999qbbJOmhYl11Z3R9d6a0QK
         RGvN4o6ThtEJrdpLkWUz2Mc20x8EVDn7+JBcyiYPJ3Epm1JQ2vEC+gepfZRKMUlhXWK2
         YvcA==
X-Gm-Message-State: AOAM533WLsnv8AXuhqT33h8IsWE2o1b53tHHVG0/vnOb/uwnQxB0jJHD
        RZJUgLxUOfcXYm0foAw4znQ=
X-Google-Smtp-Source: ABdhPJyUTPvHfixh+M2K3fcKVYT51Etc/NymGJInBDt63AZPIJWZStmaGwI5hxLiXEtXy9d1r6vdaw==
X-Received: by 2002:a9d:8a7:: with SMTP id 36mr2473395otf.287.1623407669202;
        Fri, 11 Jun 2021 03:34:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c13sm1237472otr.23.2021.06.11.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 03:34:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Jun 2021 03:34:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] watchdog: Add Mstar MSC313e WDT driver
Message-ID: <20210611103426.GA3827319@roeck-us.net>
References: <20210605170441.33667-1-romain.perier@gmail.com>
 <20210605170441.33667-3-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605170441.33667-3-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 05, 2021 at 07:04:40PM +0200, Romain Perier wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> It adds a driver for the IP block handling the watchdog timer found for
> Mstar MSC313e SoCs and newer.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  MAINTAINERS                    |   1 +

I tried to apply this patch to my tree, but it doesn't apply because ...

>  drivers/watchdog/Kconfig       |  12 +++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/msc313e_wdt.c | 166 +++++++++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/watchdog/msc313e_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0f37adb9e64..fcc10c57298c 100644

a0f37adb9e64 is not an upstream SHA and there is a conflict. Please resend
the series based on some upstream tag.

Guenter
