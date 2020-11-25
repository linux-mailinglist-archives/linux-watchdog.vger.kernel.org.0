Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC692C3A5B
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 08:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgKYHxw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 02:53:52 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36536 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgKYHxw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 02:53:52 -0500
Received: by mail-wm1-f68.google.com with SMTP id a65so1225523wme.1
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Nov 2020 23:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h6UH+WZl7FhYivW8cvDJr6VwUD+Qs+mhKfc3Xra4TJw=;
        b=iXXmOuDB5yNuwNxgBhC+081RV3rE7dBp64k9jBW/23jpbUHWWHgOF0zcm87t55PjJB
         C1gR6FBxarxdxQKdQhqBqBDCTwu61S2ByVKCUoUxboQTxjOt3eTZH68Whbo0YfYts8qN
         AjosmWGzD4KTCxiIb/1lcvmKEcS4ioSStSmHw6IyI+x+5T/ERsP2IoIV1Y1IV6NJUclD
         znNWoC7H4X60qNrMdq4SDQwHbb+fmSMtQkVdaQdr+KUBnLbjdD6K8dL01xRg7S0SSgxI
         /wYocepu8JwhGRA+ALFAtPk3BTlKk/Wv4d40IomYZ3ffSoyMh7y5HL7Yo0OEvOM2NZAz
         YlWA==
X-Gm-Message-State: AOAM532cwT6noRlKHY9YT4G4TjuI+BLpwAF6hZfn8vcLO9CFicJvwgH+
        zQ23qQD8KTkgQOikCh2rq7pspwYBlts=
X-Google-Smtp-Source: ABdhPJy9xClVm9VDniMvK6xOV7SnP1GyhmiOUwl/AGUP6iU7oR8sQqKvdm+4dCU7Wdr3J0AiLvCXnw==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr2356552wmj.169.1606290830651;
        Tue, 24 Nov 2020 23:53:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id o67sm3169364wmo.31.2020.11.24.23.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 23:53:49 -0800 (PST)
Date:   Wed, 25 Nov 2020 08:53:48 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wang Li <wangli74@huawei.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: rti-wdt: disable runtime pm in case of failure
Message-ID: <20201125075348.GA5562@kozik-lap>
References: <20201125075151.3264632-1-wangli74@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201125075151.3264632-1-wangli74@huawei.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 25, 2020 at 03:51:51PM +0800, Wang Li wrote:
> In case of runtime pm failed, should disable runtime pm.
> 
> Fixes: d342951bcda6 ("watchdog: rti: Simplify with dev_err_probe()")

The commit pointed here is wrong. The issue was not introduced there but
in earlier commit.

Best regards,
Krzysztof

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>
> ---
>  drivers/watchdog/rti_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
