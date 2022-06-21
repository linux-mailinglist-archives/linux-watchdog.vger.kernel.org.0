Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391C755342F
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 16:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiFUOIc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 10:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351096AbiFUOIa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 10:08:30 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901CF18B0C
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 07:08:29 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l4so13205321pgh.13
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 07:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Xz/ClYAwR8F5m54wyySQoTXj30qTQF969ekmxq8VrA=;
        b=Ik5xy/N2F6cWZaE8eMAT3xWwjll31yecz8wsB7Oe43ffcgHhB76vvcZL3VsNyna4Zp
         LuvJ3ItM9C9ZD6VwBgDD/vvVbeFYtbfphilsM9S7XlJSjZBBjqVLzboZ9uqFwwgBqkti
         ExTGAOmeOOdW56fI4skI4YB/zWw5t1/PGQZ6LcRC7hSHy9iB57xDHNY2fZ+h7LR8TK8S
         GjwxpO6ZsVzDBz5ohMfPJVHJIVisYgch77LwvPrBc1AAfwr6Z4IHMpyBjHCHrsmVF3jT
         ypoGzQcOcMwXERB6GFaLIFIR8McTQVM8+fu9P+Pk3QOCaJCh+NPzhRV6MB4amCU0JR5r
         gIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2Xz/ClYAwR8F5m54wyySQoTXj30qTQF969ekmxq8VrA=;
        b=7G77awv5FWAate3hEuIAfXU8oySOvTCpk+qTxwUrXOTQYDiOi9ssTIuU/rBuOXq2ru
         hvXgsEGegINl0fCJO7LCuz7VLr3xVT8b7eP7nxxLNSNlEgTAcAmJ2FcbZ7VtjCBOjb85
         Dsh1WcjXMs6o4WtzwiseW452h7gQRDnrgtJb8m9K4X2emcnGmpbuZDiKbI0NSlUjM4nE
         iMtNnEt/nmxcnBaE3jwY9FJaoDsrpGrTUxSQ++XyMVOB22t/I5gJcdLaamBrLYwOw60O
         VWyA6P8eeIzm1ZvZQ1nWQESUDm3Rz7KEOZRHHCUqRH4j3mYz+qZQ9vlURlwZ0QQLKvG7
         gpMQ==
X-Gm-Message-State: AJIora9U4cw2NRfiBdZNzUqyzWB206mgNfiOvUBHKoRUJB+KhkBFEJOY
        2vBw2/bbwtqjL5DEI1liGmo=
X-Google-Smtp-Source: AGRyM1s79Ab5hvcskRNqHIOJA4jT8YKNNjYhjxD3w68pG1nMk3/+XXNi0L5Vl/5zaOOe5kJ/RjCHTQ==
X-Received: by 2002:a63:3386:0:b0:40c:977f:59c1 with SMTP id z128-20020a633386000000b0040c977f59c1mr13340742pgz.421.1655820509004;
        Tue, 21 Jun 2022 07:08:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i22-20020a056a00225600b0051bac6d2603sm11412609pfu.214.2022.06.21.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:08:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Jun 2022 07:08:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-watchdog@vger.kernel.org,
        Terry Bowman <terry.bowman@amd.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH] watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO
 resource
Message-ID: <20220621140825.GA3437760@roeck-us.net>
References: <20220621152840.420a0f4c@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621152840.420a0f4c@endymion.delvare>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 21, 2022 at 03:28:40PM +0200, Jean Delvare wrote:
> Unlike release_mem_region(), a call to release_resource() does not
> free the resource, so it has to be freed explicitly to avoid a memory
> leak.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 0578fff4aae5 ("Watchdog: sp5100_tco: Add initialization using EFCH MMIO")
> Cc: Terry Bowman <terry.bowman@amd.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Unless I am missing something, it looks like every caller of
request_mem_region_muxed() has that problem.

Guenter

> ---
>  drivers/watchdog/sp5100_tco.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-5.18.orig/drivers/watchdog/sp5100_tco.c	2022-05-22 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/watchdog/sp5100_tco.c	2022-06-21 15:07:31.868814828 +0200
> @@ -402,6 +402,7 @@ static int sp5100_tco_setupdevice_mmio(s
>  		iounmap(addr);
>  
>  	release_resource(res);
> +	kfree(res);
>  
>  	return ret;
>  }
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
