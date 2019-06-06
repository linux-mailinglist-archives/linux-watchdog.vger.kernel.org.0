Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6603A37F6D
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFFVTu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:19:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37860 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfFFVTu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:19:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id 20so2058136pgr.4;
        Thu, 06 Jun 2019 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ETI+7pTqBeuHgO92av6q3CqrjctrJYtwPXoWZMoSaFs=;
        b=khz07sAlInTxnYBQSSaUpIYcTzg/9hObaLHKuU8ic8BX0Cb0z0QuIgKwLLnNPV+PDK
         QAs8v2tfQrjRGQDkODNKnj/BfnK5W/Rq0N2eHi8O7Qj6xYD2MWu3mcB5PiFv9y2QBdtO
         ZUSXHZ/TLZm0ZxthWY6iu93UIIDMx1SPTOFhUzgcfyPIgPqMC71doxcUEVS3eeQqO9VS
         /2ynD8R3r8MGBpmVooN6dfj0EEDKhrigMQWXp8vrJyOtr4CBHnmrWht0P12Z35v0c2H6
         p4gS8Qw89cOhCrt4JGCrwCS0WKUo20N7sR17WCklv6fMjsEyZA3TgtsrkFMPi6LxaKa3
         Pb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ETI+7pTqBeuHgO92av6q3CqrjctrJYtwPXoWZMoSaFs=;
        b=BkmjQ1FP9HpQvX6bveMDDEdEgjqMYgt5nNOWSP/iqyf4WlSV93jvrZlRvPpOUunQkz
         wzwQ/fBhrv3Y+tmKIPFplJClDQ9gWCAGaethgwrWjDnO0xwaPdZM/rUXimnm19z/iCd2
         DzuhJn5ZG7O/PkzsPa40R4MZwxwW9mPASQ61oyU2Aido/zjWHezxt4sjUssVuuJjySIJ
         eFWn0kKg8dsWNrlrmL6JfO1I1tYoUf2+ii00wf10vIOTtcAFTO9SH/BkPzy9rdSeIpNK
         w7NtJfZayYMGstivQ4c2vyXKCkpnmyhsHuEyQs9tDV99sZ3TjmdOsLy7f+k19fmCBmn7
         FbnA==
X-Gm-Message-State: APjAAAUTNEJIMDJxpTnnhQczSM6TPEeMVLhVbzwrOPiN3eFdMuKvPu+4
        RwXXlW+Opw2kNzJpbB8vJh0=
X-Google-Smtp-Source: APXvYqxm/N7/lpEGW6Ndwn0WH9v4IyJ73ZE9E94lKarHF3W69GikmYQfHO09x4YXNRmH96PIazpDzw==
X-Received: by 2002:a63:1e59:: with SMTP id p25mr513629pgm.270.1559855989766;
        Thu, 06 Jun 2019 14:19:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b35sm17752pjc.15.2019.06.06.14.19.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:19:49 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:19:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk
Subject: Re: [PATCH 5/6] watchdog/hpwdt: Update documentation
Message-ID: <20190606211948.GD1299@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <1558126783-4877-6-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-6-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:42PM -0600, Jerry Hoemann wrote:
> Update documentation to explain new module parameter kdumptimeout.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/hpwdt.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/watchdog/hpwdt.txt b/Documentation/watchdog/hpwdt.txt
> index 55df692..35da141 100644
> --- a/Documentation/watchdog/hpwdt.txt
> +++ b/Documentation/watchdog/hpwdt.txt
> @@ -33,6 +33,10 @@ Last reviewed: 08/20/2018
>                 Default value is set when compiling the kernel. If it is set
>                 to "Y", then there is no way of disabling the watchdog once
>                 it has been started.
> + kdumptimeout  Minimum timeout in seconds to apply upon receipt of an NMI
> +               before calling panic. (-1) disables the watchdog.  When value
> +               is > 0, the timer is reprogrammed with the greater of
> +               value or current timeout value.
>  
>   NOTE: More information about watchdog drivers in general, including the ioctl
>         interface to /dev/watchdog can be found in
