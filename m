Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDCC1C2664
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 May 2020 16:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgEBO7T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 May 2020 10:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgEBO7S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 May 2020 10:59:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A85C061A0C;
        Sat,  2 May 2020 07:59:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x15so3078430pfa.1;
        Sat, 02 May 2020 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PvNspPh6XnwIJVtk7dVIO6YRm27tK9b7y5sCOvhwH2U=;
        b=lQ0TexyDqSRKuQPR7qikbPUqO6267sDUhkfvkHgS8i71jHr+TXpfJwYsUa26ZmNziK
         hTZEmUHMYFyIbTnsOZSd+7PBTjmkVXGRjadlgelJUhbKjT4Qzdt6dvbNj+XviCaVp7qn
         Bz+3AzmOpf5ZwUar03PkFTaV/7Yr8y1ukzwwip2QP+iqz2fVtyGV4n+kT6TMn9N3HMaC
         +5my2urqkdzrX75VMzzNr1yBC35zIKYUB1O1aWLPfb7N8wITJjZ+lcqrxApyG9XoMRzw
         GbbQAIh0m8XnRDB7P3P2tExsoqeCBO+BAUWGoLdczwOvvHoDasr0DBLqaZXMWsg7dFBM
         J3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PvNspPh6XnwIJVtk7dVIO6YRm27tK9b7y5sCOvhwH2U=;
        b=Vo02WMbpBA8489WfWAqdi7/yU57txSE9aN3MuS1Vi0A0aGv8tky7ZBI2ksIhxA6Bav
         jQJswbxAnrHgYLO+9iC/TNYuQ5Dh3tc3xgFfg52Ja15oK2EcRSBWWZsG1qxhnTVJmQBP
         +wlKnMkrF2J+PVpEPkZKA1XMrfAA5XsKBqqlBMg699UIgKOjakUA6GS+7TR2h3xwT6kJ
         wVYtVHUDYhfmAysz1CJPLCMtJRHQCHTWS2wKPnQtwLuLEqszJMjPM4nVeJmqjSOLv4tI
         QwzvJHsgyqdmtqnk1D1MElzd3cXsBL8tdNre8k7p/oe2ZLz4bglurcSsIBthd3a/yipn
         SygQ==
X-Gm-Message-State: AGi0Pubs+IBXp3+tYZMilHCNfER16x8+DgfiYgQCy5X0bBgztFyR9Pip
        aDl08GNZbr6khnxK4v3KlWDLUrLM
X-Google-Smtp-Source: APiQypKBlGGjCcFAlU6pAR0pMd9yE7ZWR4UtjSulAKcWGP53/K91VPE97U8lSZTYaBigyqYcnT9WtQ==
X-Received: by 2002:a65:4b86:: with SMTP id t6mr8574464pgq.177.1588431558111;
        Sat, 02 May 2020 07:59:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a99sm2432025pje.35.2020.05.02.07.59.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 07:59:17 -0700 (PDT)
Date:   Sat, 2 May 2020 07:59:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] watchdog: update email address in conversion doc
Message-ID: <20200502145916.GF189389@roeck-us.net>
References: <20200502143103.19473-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502143103.19473-1-wsa@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, May 02, 2020 at 04:30:58PM +0200, Wolfram Sang wrote:
> The old one is defunct. However, I think it makes sense that I am still
> the primary contact person for updates here.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> ... if there will be any. Let me know if you agree.
> 
>  Documentation/watchdog/convert_drivers_to_kernel_api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/convert_drivers_to_kernel_api.rst b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
> index dd934cc08e40..b972ef4c7cff 100644
> --- a/Documentation/watchdog/convert_drivers_to_kernel_api.rst
> +++ b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
> @@ -2,7 +2,7 @@
>  Converting old watchdog drivers to the watchdog framework
>  =========================================================
>  
> -by Wolfram Sang <w.sang@pengutronix.de>
> +by Wolfram Sang <wsa@kernel.org>
>  
>  Before the watchdog framework came into the kernel, every driver had to
>  implement the API on its own. Now, as the framework factored out the common
> -- 
> 2.20.1
> 
