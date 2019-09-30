Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F8AC21A6
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731079AbfI3NRP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:17:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43373 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NRP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:17:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id f21so3897157plj.10;
        Mon, 30 Sep 2019 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B4ggzzzVRq7D1/IrWYPZsS6mZyXtJfN7dDcsMNzyKxY=;
        b=mDQBmKq29AbFtd1CnyEwPK/vZbkcZ7/cSi4rUC6VX2Xyd+TWXE5t9hFSNvgcrmaqCq
         VjVJcQ8YShs3drchBpCCG2mvNK6A54mf9pPaKx7McgcZKAuXJths5euUNspk26l42Ymr
         vVmSDhM/rUSnkKNnkHRLZkB2V2I1WcD56J5cYGVwnw0XW9i85pi4rzQ9UCH4IDx/iVR6
         Bh+gXAywLHOb6x+tev6zVykr2xJrqTXZgES8LI6FxYY3c19qiXffhQzIXVDgl9+8ASEz
         6cqGUpVMhENeeEiLbb8thoTzdBdwQ2BMUB/qlkx6YbXPS4bZTZQU8BZd1q6sgsqWIipF
         dTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=B4ggzzzVRq7D1/IrWYPZsS6mZyXtJfN7dDcsMNzyKxY=;
        b=RtVsBVbyyUBjbgUdMpnoO5H9ZAJc1hbElGF5vctb/yWrdsqX7ItClKROqwILyWQxxU
         6+1CQ8EgWGwbRseHndy2FAeruRu9GrLgWFiUByTO+e/AOku8iG7K0Y9xftdUiox/oDqd
         O3jk7lPRBIQi7Le9tbsTGz4oFYYVW4082bvjBXAhiWBeHTwiA3r+RisGKn/8PcUI8ivz
         kdaKD9jTf6/JOf7iudXvSC2TOcimfU5yppwcjfeqdfRFiLW4k7msl/+8pLRUDBhqvWqs
         tZPBEE2tgRjX1xx6Ep1hqvwQ9aenmoUArJX7E/dnpvd9wg0DqWLOIKlFgMxzLCmj5XpB
         Sp8A==
X-Gm-Message-State: APjAAAVJ6Ra1t4ZsrqgYu4zG0ErVK5Q4llRb7tiHlT99mxWobCxZLRAP
        k6V1bXiBFO3KDXBOQhqAsh8=
X-Google-Smtp-Source: APXvYqyORv2gkjwW7rfZFXwSfREuRsSvclviOWTEAU/DB8OGnqKhjK89jVUVsDBYC2vqB77YvAkwqw==
X-Received: by 2002:a17:902:d685:: with SMTP id v5mr19638281ply.15.1569849434796;
        Mon, 30 Sep 2019 06:17:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bx18sm11615970pjb.26.2019.09.30.06.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 06:17:14 -0700 (PDT)
Date:   Mon, 30 Sep 2019 06:17:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 1/3] watchdog: imx2_wdt: Remove unnecessary blank line
Message-ID: <20190930131713.GA29750@roeck-us.net>
References: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 24, 2019 at 03:07:06PM +0800, Anson Huang wrote:
> Remove unnecessary blank line.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx2_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 8d019a9..6711b4e 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -72,7 +72,6 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> -
>  static unsigned timeout;
>  module_param(timeout, uint, 0);
>  MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
> -- 
> 2.7.4
> 
