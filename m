Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8661472D3
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 21:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgAWUun (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 15:50:43 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54430 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbgAWUum (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 15:50:42 -0500
Received: by mail-pj1-f66.google.com with SMTP id kx11so5050pjb.4;
        Thu, 23 Jan 2020 12:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tz7oPfyxX9BD+xzMJnGaVoJGnhN4ODjNZkmfQaubnZk=;
        b=uDpTmgI33ECUY01x0pqytt117lR/SxR58Q0Opmd7zVrtQ7nxmoD+GuqybKzE/yQy/j
         jgrDCNo7rTPgYyKNvMNtZ9GqRuugASPFJH3dqvG/JbHoIwqWzWvIZJ74ExHYH9oAiXFk
         TNJvpQAKBoWo14qeN167oyiY/lS2VcOReBgAdLJfUCn99/YKX6SC2DJJWUzNYprn6nOb
         eWAXe93lU+1yWHbZKg14EkRjM+P69NbiZDxBqWeQxyM+wRtz+FVM273uv5MMD1jKb8iK
         QPXa4G2wMx528+PEKDZw9jdPeFhWOYM2o4BnwlJlZwR0ISLeABk4gWds1l9J1QdDu7kC
         LO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tz7oPfyxX9BD+xzMJnGaVoJGnhN4ODjNZkmfQaubnZk=;
        b=XxQVjNTKwiGgW/MM0l8lp0umwdnqGqWHFER8LPrvgfUpUeVdw+mlpoS1sdx1VJav/W
         0/6JoLKYWrF2o6y4ppTbHsPDHVms/skk9yR3+72wL94cK2x4/fE3PF3YL3TiMf0gJn6J
         cc/Rw+NIQGqmjfbtYxcBeoP3w7slreeLYnE0b8kVg1R3i3upwQlW2hkB+sjCbVUo2Qto
         v67M67oHwye4XZUp7Cn5BTzFTr88VUf3u6VAm/Qo2TUcpBgY4B4UwbIQDxFKB6GqqGR4
         V//MIWl30Kp3HyQy0hD+dGT5zhenVNhlvhspRNkEJMHiUNG9ymuv/qgd8oNYiVSZ0RTc
         +lOw==
X-Gm-Message-State: APjAAAUyv8SEmrKZ1XJOMGyLZHEcukdv3c8XxOLHy+ZSWu5aEgoNqhk1
        aNbWnqd92RIcMAx3fbNCNWqOUWwy
X-Google-Smtp-Source: APXvYqzdJ+Yt5rZTFDz7nD9oG1L83Ph9tCIN+wYgO3+j09sFFqD1b46eoo/libghsRSPvsSgB3H0JQ==
X-Received: by 2002:a17:90a:be0d:: with SMTP id a13mr6593209pjs.78.1579812642075;
        Thu, 23 Jan 2020 12:50:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm3741842pfn.5.2020.01.23.12.50.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 12:50:41 -0800 (PST)
Date:   Thu, 23 Jan 2020 12:50:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: da9062: add suspend disable
 option
Message-ID: <20200123205039.GA13268@roeck-us.net>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108095704.23233-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 08, 2020 at 10:57:03AM +0100, Marco Felsch wrote:
> Document the watchdog disable option which can be used if the hardware
> automatic suspend option is broken.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/da9062-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> index b935b526d2f3..950e4fba8dbc 100644
> --- a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> @@ -6,6 +6,11 @@ Required properties:
>  	"dlg,da9061-watchdog", "dlg,da9062-watchdog"
>  	"dlg,da9062-watchdog"
>  
> +Optional properties:
> +- dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
> +	Only use this option if you can't use the watchdog automatic suspend
> +	function during a suspend (see register CONTROL_B).
> +
>  Example: DA9062
>  
>  	pmic0: da9062@58 {
