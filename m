Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D59151DEF
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 17:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgBDQLu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 11:11:50 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38386 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbgBDQLu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 11:11:50 -0500
Received: by mail-pg1-f193.google.com with SMTP id a33so9877409pgm.5;
        Tue, 04 Feb 2020 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V+cYisoVlXbzdOPJU0/EsbztEMzDD+Up0QG4aFr1054=;
        b=rzuIGOuXeVMHS9+5/ZQUK+GuPFPAqjQYrt1KaJe7BViMSvaMtB/rPi3jZQqK/bQoNb
         f6YHmX8AyGwL4fkzSHxtelhZtKB8lMaCSjYJMaINeD+zD3+MkXMD4cpTWVv9GE1Yp2ur
         GqUArcEF8ZMRhhIu/x74f+Ku723UfjvVlCS9AjP+9B5dYE2cLJUR7RaPLUhO7BAMYAnT
         +2hYledcrYI2Szo7SWCshIy2q6VrWm6DpNSQ9/L92bVUif2c6vsqx/4qIhctY2xtaukl
         gRwVNyZ1Q1kOGyaxqoXEUaPZHzh9QuV2c5iOwXb9NozbqdCWn/pjWEXwc74R/d7guyVk
         efdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=V+cYisoVlXbzdOPJU0/EsbztEMzDD+Up0QG4aFr1054=;
        b=pTDB0yhQEw5pMaf2b5N7XtQoCLS+dDoWr4fCFpRNZsSGB+D/DmHU8ZaBavrNrTNSbx
         XNa7iD+6gb1JsdPLS4bst6TBevbbwsqHpkhut6MbD+Xd2EGBIjkReXcxq36ALsZKd4LF
         dCmJsG9g4FHip5KH4Ih5/YgXEraizLKWcdVcNjXmQIX06/Yt2T8ns8qgo/slrKFPpNUR
         kIkgDf49YUw2ba7YRLwFI/oA7cNOQ2oYXET8XB2J0OXwOF7rWBXJH0vYkTGgoBnAfknC
         6M2andJ+5gYUzqkfy1Skc48c80Iy6BmdDNO1l6cZjkWehZ/HPOuthfizccRLgsXb6SKS
         nxGg==
X-Gm-Message-State: APjAAAVPbAo8Pz97DJeutOdYPe0iSl9uPM8omCWXecwHd4IeLnIGARQS
        0oveSwJJ667MQTPPA+uZ4x4=
X-Google-Smtp-Source: APXvYqxD05ec97YIo/YDmjZyz3awYH68AxoOhXx83xhb+6X3R2RNb0Brkqm9D/3kOUQYRhFvuM/Dbg==
X-Received: by 2002:a62:3304:: with SMTP id z4mr30093384pfz.79.1580832709903;
        Tue, 04 Feb 2020 08:11:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o9sm21675657pfg.130.2020.02.04.08.11.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 08:11:49 -0800 (PST)
Date:   Tue, 4 Feb 2020 08:11:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation: watchdog: qcom-wdt: add new
 no-pretimeout option
Message-ID: <20200204161148.GC17320@roeck-us.net>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
 <20200204152104.13278-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204152104.13278-3-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 04:21:03PM +0100, Ansuel Smith wrote:
> Add description for new no-pretimeout function to force legacy
> probe if any interrupt is defined.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> index 33081bd33637..01978bff74ee 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> @@ -14,6 +14,8 @@ Required properties :
>  Optional properties :
>  - timeout-sec : shall contain the default watchdog timeout in seconds,
>                  if unset, the default timeout is 30 seconds
> +- no-pretimeout : shall be set if the platform have some interrupts
> +                  defined in the node but doesn't support pretimeout

As mentioned in the other patch, why specify an interrupt in the first
place in that situation ?

Guenter
