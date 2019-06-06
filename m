Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E16237F63
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfFFVSb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:18:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34275 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfFFVSb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:18:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so1425430plt.1;
        Thu, 06 Jun 2019 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tk0Ucz4UPnhXdNKC7+CXSk6E0T2TZryVe9IV+qyUnvE=;
        b=jYy9j/AH4Tok9xj9if44laLLzD+mqUyMlMzk06ysRkZCSHFQQY06wJ37vkzMcEueB5
         Nbd/xQ/rkyoGP0yooHfvK7p+zQcgiqyi0EKSzNua9WM1PzfaAq+0C0zgcdX7n4nRBXb1
         ALea4L19le00+JUXnbYQ4/o4Ko4bSLBtTYd/gBPyz5MPc9v1pvj3N07X5qpWa8q4cncR
         H3sU1kCeK1TCfICXxwwyIWVjADEezTvarAC2iuLyWGiF83JF8IFBuJVggppWML4MJl+0
         E5SshQgvaRf/AKSFOBMFc/G53FFpPrYVZKq/kXkd/IMHAep7CAhfk1T92kjfff6JcQEB
         a/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tk0Ucz4UPnhXdNKC7+CXSk6E0T2TZryVe9IV+qyUnvE=;
        b=JesB/0u+t8TnAECQl5B+m56PnCQkVIbBdFh3s7eCDp8JTJzPz29DDCpzdO/HZbdRPL
         hQ37IeJLgce6eMiRzEDoRx6e3CegHkoGgi681l/cfQNh6PHLCL4lGJo5Hpd7N7rcRRMP
         7pHzSmqW6/DDiqdC2QCIxi2Id83FPpaczrFq9B9zv3UnyrbShjO061wE37N3O4mxHDax
         809n8vcKlQbANIf/a8NLJbsQR2THoiOuOU1Y0eHrzbDAL7Wo/7P2kQDXwIuiUaa3Xi9w
         T89dRq6cA5uwFVnxAJT6PGrDBIjxEFC/M2ipah6Ut8EF82acz732zoVcpyNdrgKEoCDr
         bYLQ==
X-Gm-Message-State: APjAAAVjLbECTAZOZKZh2amQmvHxq5GvKq01M218ZiOQb9IrzpGW2vgI
        h4r0utPFlEoILwgTr0IvQLE=
X-Google-Smtp-Source: APXvYqxXVkNBTcZx5Xlk/Jyq0zMJVHwK9+sAGGAj/kID7B6iO5mv+8hULbV0CIQ/5smvYgZStfzbbA==
X-Received: by 2002:a17:902:b70b:: with SMTP id d11mr53272522pls.84.1559855910815;
        Thu, 06 Jun 2019 14:18:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 137sm71657pfz.116.2019.06.06.14.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:18:30 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:18:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk
Subject: Re: [PATCH 3/6] watchdog/hpwdt: Have core ping watchdog.
Message-ID: <20190606211829.GB1299@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <1558126783-4877-4-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-4-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:40PM -0600, Jerry Hoemann wrote:
> Instead of stopping the hw timer during probe, have the core update
> the timer if the timer is already running.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index 9f7a370..aa4101c 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -59,6 +59,11 @@
>  /*
>   *	Watchdog operations
>   */
> +static int hpwdt_hw_is_running(void)
> +{
> +	return ioread8(hpwdt_timer_con) & 0x01;
> +}
> +
>  static int hpwdt_start(struct watchdog_device *wdd)
>  {
>  	int control = 0x81 | (pretimeout ? 0x4 : 0);
> @@ -302,8 +307,11 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  	hpwdt_timer_reg = pci_mem_addr + 0x70;
>  	hpwdt_timer_con = pci_mem_addr + 0x72;
>  
> -	/* Make sure that timer is disabled until /dev/watchdog is opened */
> -	hpwdt_stop();
> +	/* Have the core update running timer until user space is ready */
> +	if (hpwdt_hw_is_running()) {
> +		dev_info(&dev->dev, "timer is running\n");
> +		set_bit(WDOG_HW_RUNNING, &hpwdt_dev.status);
> +	}
>  
>  	/* Initialize NMI Decoding functionality */
>  	retval = hpwdt_init_nmi_decoding(dev);
