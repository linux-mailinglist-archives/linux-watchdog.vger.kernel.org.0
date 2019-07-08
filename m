Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10298627C1
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2019 19:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731208AbfGHRzg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jul 2019 13:55:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37840 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfGHRzg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jul 2019 13:55:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so5344859plr.4;
        Mon, 08 Jul 2019 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JQzFF/RckCkhuwNFuRy0cMNgK/vj6j07C5gg5EjYC5w=;
        b=eJFGtNXGJc32gGB/6l525EN+V8aaRxwPXh1Wvq/j9Za/SBLdzuupq+d6VjJA6eF1nZ
         1fDEZSMvZeZr1QH2SjYRqOmRF6shJGpc49ujWUL+2e4cOhAa1Kb80FRs3GH8IQzicgBx
         Bnm6zVKNMzgAT0V6hGs6Y7StIGeL550oEUgXZgxTCo4f92kobdUqw7/jechwBdkn7kw4
         bj1K9Ohf0Q8VQbm3M2ZFVru9VgkL/H/vlqy62GRnZQYQ6yhePxTe5rG4XitPYfZ/NN07
         wIfF7/42qBlnj2jsZyUQ2OalZuurg2ejLyw/1aH494x9NZpKajvCGqp9pKlyB6fMziAs
         /esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JQzFF/RckCkhuwNFuRy0cMNgK/vj6j07C5gg5EjYC5w=;
        b=bZlzx+CgF3D9xE8eQE87XIc4uAPgFkPBCbbTz3XdD5XIkkdytwn6C6RhJVVEbCFufM
         kG/a/ou2HBa3bHQrGOPJy66PMOh+7o/wzke9NLMXmxZX8Jem2QtgUFYW7afBlNDQN2PQ
         +BCVphOqB2SfN5jDbMXgsZmFX8vVBXe+pBbNmY/tp7GC/RnPFYSctvdNBi96G4waiJ3e
         hOdPXgONzWay+fwtXdcI2+9Nv/WPZ7W4Ov+aVvg84xOA83AK/tRVNP3TvY++0pWv6Of8
         CEm2EOiRod8OUu4HFrCpdkJrlyJLFkLfWWN2XQyvQw+iSEtH+NevBUyiLN9Y2edVsjQU
         ebRQ==
X-Gm-Message-State: APjAAAU7jfeUfn44RsRhL8aXTw61cyVNWJCpQcReVDOq8fPsNaeMVJDG
        XCUD5xIksr2KaZ1iM8Ai+Uk=
X-Google-Smtp-Source: APXvYqy/4PiXebRAVSHaa1fp8T9XCHHDOFkASSk4BR6LQjeyzB2HF7cNk4nyctjRgy+ekKKHDcRjTg==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr26336254plq.223.1562608535496;
        Mon, 08 Jul 2019 10:55:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k70sm174264pje.14.2019.07.08.10.55.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 10:55:34 -0700 (PDT)
Date:   Mon, 8 Jul 2019 10:55:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Peter Zijlstra <peterz@infradead.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/7] watchdog: ie6xx_wdt: Use spinlock_t instead of
 struct spinlock
Message-ID: <20190708175533.GA14138@roeck-us.net>
References: <20190704153803.12739-1-bigeasy@linutronix.de>
 <20190704153803.12739-6-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704153803.12739-6-bigeasy@linutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 04, 2019 at 05:38:01PM +0200, Sebastian Andrzej Siewior wrote:
> For spinlocks the type spinlock_t should be used instead of "struct
> spinlock".
> 
> Use spinlock_t for spinlock's definition.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ie6xx_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
> index 508fbefce9f6a..82a8cf61efc2a 100644
> --- a/drivers/watchdog/ie6xx_wdt.c
> +++ b/drivers/watchdog/ie6xx_wdt.c
> @@ -66,7 +66,7 @@ MODULE_PARM_DESC(resetmode,
>  
>  static struct {
>  	unsigned short sch_wdtba;
> -	struct spinlock unlock_sequence;
> +	spinlock_t unlock_sequence;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs;
>  #endif
