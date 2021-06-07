Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0288539D28D
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jun 2021 03:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFGBZc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Jun 2021 21:25:32 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:37796 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhFGBZc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Jun 2021 21:25:32 -0400
Received: by mail-oi1-f176.google.com with SMTP id h9so16478056oih.4;
        Sun, 06 Jun 2021 18:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K+6yDkXys1JzDEdCq9xIHVfhWVlTrD1kEuu/cjBEdAM=;
        b=LE0V03IiabLksBAANK0//K8bEg1f10YTENY8BkdupzT0o5c2vTtKAaBrF54JxvIOFa
         rYiY7q+SoFP/iFgThulho2FeVmhKbvlybbjHH36QYeD/P135/dxGQeuECh7y/3LGlQqn
         UXTHY0+YXQZ4GIRKkVy5yIGYIYuSNqpvEM37jQeM+YhIvoyDiB/2nXuBNB599p55PQpC
         GAKlXy4yklfpayo5V8AHWoc+VNLAdSRouS8JV/upUG/ZRojP1wB7aAPCNAlEmEcZJNz7
         tYN4HqicZKzYULjx8f8rps/XJIEPrAw7Gfxj8HIQQlrBIYfaXH3/7h7bGekC5VFfegGY
         YZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=K+6yDkXys1JzDEdCq9xIHVfhWVlTrD1kEuu/cjBEdAM=;
        b=Lq6+rTzZqyTDle5nfx5BlZTD2/YQ8kXHEG1eh4a+9vL/e1bWFoS027ZV1kShiAQJOk
         mJYzJMJMcjmSHg4sfoGJAwIqDy9XwKMAtoxjEEt7r8/cAnz5VedGNdBGuv5atzfgTMeM
         6YIcDw4D/Hij5wx3ZoRmjeP9poCAKtEWBIG5rEsgS7Q/LPvuNj7np9jfFbQWrisDFoP/
         pBk6IA2md6+rFnhO7cvP999lcEg42y07o0OPj8H3CDp8amNLb+oynOrMNUJFX9xKVTM9
         KyvvWMXI7SKL+QL/eEzMFRslryOcqQk0GGH4t53tX5K221wdylRq0LyZRa3qEDcaBK7p
         J2Qg==
X-Gm-Message-State: AOAM5314kglwNvwvUcaDPx09n2dwOEvh2gvWeyb0gFhOABLwfsqMtin4
        gO/NsZAMnx6KpGI9v2+7bJU=
X-Google-Smtp-Source: ABdhPJwTyJHHp0jvVvxSntdBRZJiJ9G3+AIejmHZidj5T1ZXpOXNCw5w1K93M0tVKTsP32ecWATKrg==
X-Received: by 2002:a54:4d98:: with SMTP id y24mr10363321oix.18.1623028945066;
        Sun, 06 Jun 2021 18:22:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g24sm2044425otp.17.2021.06.06.18.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 18:22:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 6 Jun 2021 18:22:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     wim@linux-watchdog.org, martyn.welch@gefanuc.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] watchdog: gef_wdt:  Fix an error handling path in
 'gef_wdt_probe()'
Message-ID: <20210607012222.GA1269917@roeck-us.net>
References: <3d775a5ac7e26fa5dd4c47f75fef6d5f336de1e3.1622990863.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d775a5ac7e26fa5dd4c47f75fef6d5f336de1e3.1622990863.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jun 06, 2021 at 04:49:18PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful 'of_iomap()' call, it must be undone
> by a corresponding 'iounmap()' call, as already done in the remove
> function.
> 
> Fixes: 3268b5618f38 ("[WATCHDOG] Basic support for GE Fanuc's FPGA based watchdog timer")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

<Formletter>  
Please do not submit patches for old-style watchdog drivers unless you
have access to the hardware. If you do have access to the hardware, please
convert the driver to a new-style watchdog driver. I'll be happy to assist
with the conversion if necessary.
</Formletter>

Thanks,
Guenter
