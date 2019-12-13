Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2FCE11ED55
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2019 23:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfLMWBR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Dec 2019 17:01:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42484 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLMWBQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Dec 2019 17:01:16 -0500
Received: by mail-pg1-f193.google.com with SMTP id s64so130500pgb.9;
        Fri, 13 Dec 2019 14:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SyJOTro2Qxj5zknOopzR1wfS5jIi3FQ8gfidzuJ6Ln0=;
        b=PqUvY8iyQctARCA98nfJzXmI9y23oL/C1rZgk7xmiGEMxrGhd921Z3GY3hgcUCtbky
         nwVpVoGrZ0VVkX6pt6MiZO5ePD/gUS6VJGhSzEngGAvjmnJ3IHODu2QTuwj6/OMVjSEr
         9LR147pNwwHtpM9K3rgfX+WL75u1CHDpNvHtP/fX8OaLKrRdUA0Plf2E5e9Vit9vzksk
         /dMpL71BRBCGlpW8vbruQaiZC6sMt0xVgunxLkbjAZy+cFW/uHbqmB6QvGgm09nQM+Jb
         XOMe8BMyuSWTM3iHQpSuoLQHHPwr2PwtzAKk3UEZl3rgKUBEcqkdfiG/f5xGwk7ciQ6R
         BnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=SyJOTro2Qxj5zknOopzR1wfS5jIi3FQ8gfidzuJ6Ln0=;
        b=k2fvFyf/RZ7rUtdpOn8R8HA8a4UFRYAtKi5JLczFFp646c8G6WjDvll7VNiVJcJVwa
         0YWuy5qn4nZzxS7cXCQsmO6N+B4BOLEE4b6ssCfuDOv48YnYGud2YlcTaUKLMuiNnYW/
         Ue+UZzH5XaKCOFq/Tr0RBzJ+68S6C3DRh781qfagyW9uTFjsT4yXi5+hL6A+N22JSZA8
         jkjLlc6gR3b0Z/KFSPM7TLtmFO03GHFfSjz3/MeL0EVBIJLIl77hg3Fp4zPfnqsdyjYa
         2OI9vkzWEWHfogb5od+ErjDogcsPj+POn/SBDkvUp64NuGXlf5n/9iYbTQVYs6EIdPBh
         nCWQ==
X-Gm-Message-State: APjAAAWnGPPQxrjgNBhW8cvWnvRkyrDiRlcPoyOFfqc8ewd/0ZkQWPX5
        qDAWV5lWp3q0Efb2xjy9YcGElTCY
X-Google-Smtp-Source: APXvYqxeDfBH3tpaDeUWX2B6kuiOuVVyMBcKaeGE4AjkrDCmP6u1u1qTMpuEkKNIDPJCXJEIea85Cw==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr1862107pgc.243.1576274476076;
        Fri, 13 Dec 2019 14:01:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w6sm13780681pfq.99.2019.12.13.14.01.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 14:01:15 -0800 (PST)
Date:   Fri, 13 Dec 2019 14:01:13 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: rn5t618_wdt: fix module aliases
Message-ID: <20191213220113.GA24460@roeck-us.net>
References: <20191213214802.22268-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213214802.22268-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 13, 2019 at 10:48:02PM +0100, Andreas Kemnade wrote:
> Platform device aliases were missing so module autoloading
> did not work.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/rn5t618_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
> index 234876047431..6e524c8e26a8 100644
> --- a/drivers/watchdog/rn5t618_wdt.c
> +++ b/drivers/watchdog/rn5t618_wdt.c
> @@ -188,6 +188,7 @@ static struct platform_driver rn5t618_wdt_driver = {
>  
>  module_platform_driver(rn5t618_wdt_driver);
>  
> +MODULE_ALIAS("platform:rn5t618-wdt");
>  MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
>  MODULE_DESCRIPTION("RN5T618 watchdog driver");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.20.1
> 
