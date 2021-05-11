Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2BA37A7C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 15:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhEKNgt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 09:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhEKNgs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 09:36:48 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEFAC061574;
        Tue, 11 May 2021 06:35:42 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v22so14149129oic.2;
        Tue, 11 May 2021 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7bCvijUWet6cLTH1ROcBoC9SaXhDDg8tibdm/SSOFjc=;
        b=l5csFblyhcqmIxcneIJvOs+169tU+WVqWDtw2dKeD50I994vKtURyxiYa1It/pRfEz
         Wwb2MWOoTqybjz1aXKBy+OetMziJREHHmDGAD7Ihp7Q6MKp+9bwBFuQ1HBXXEOkqgTsa
         w/60ZsWCoLn3Bmxbe5jOxirGv6wXt5FZZYAnZWTZeHZzkXC4RbFFwx0Gkw+SdDQmsAEr
         Cq4cEjHcBZQqWKNmQmEx+vGmAusf63+ci9zyWPBKN2NOOO47J1N8/blLIzNJplLFK+23
         BxpvuCzOoycVejxebbLiQm2rsqTZ+fTxymOy3wIimMBucZzMIWCMu8I/2SHVefVfHMMZ
         zGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7bCvijUWet6cLTH1ROcBoC9SaXhDDg8tibdm/SSOFjc=;
        b=P+gcsBDf+Vb79Zhj9aVGiP3qpeecUkv9cOYlRaz8+Aq9+cbRtb6VHmwORWXvJJgnjU
         nz1Kok8q0xtYO5wL039Mnrs3MbznX16yh7HxnGKMi0Eu7ClYrPKkxWee6926kNg5bsDS
         t1F26GTSltLAw5L9mJlSoFoG7gh1evYI812dROrY52bIqqXo19zpemZOiPZmtDznRxMa
         /PKCzyZrUyVcoPCw5Yp/+UdUc6AR95gT95gUDH0jSVPPXy4HBx0EpjX4940/MEJzamGY
         XyPFnEion6raXl+rREgEmk3cwhucR8TaVs+PW8kODmfITX6oaWdIwyoMdw+UdXkucX6a
         UNFA==
X-Gm-Message-State: AOAM533lgbiiJ4PcPX/UcAYNGZwhTVvN7UcDVXI86sx3XdYaskqF9Wky
        0iN1sH0MXTFzL5dl/xR0tjyFG8J5CgA=
X-Google-Smtp-Source: ABdhPJxZ/5UP6PfxDkP94zfD74SOVugTC3FpCRq7tP/0c09HtRw5s4EHG2Lz8+jNRtulYBOvG1MUIg==
X-Received: by 2002:aca:628a:: with SMTP id w132mr3601969oib.147.1620740141575;
        Tue, 11 May 2021 06:35:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y13sm3271871oon.32.2021.05.11.06.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:35:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: Add {min,max}_timeout sysfs nodes
To:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
References: <20210510131625.21506-1-juergh@canonical.com>
 <20210511062953.485252-1-juergh@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d85c4b92-17a7-67bb-d53b-38577dc10b00@roeck-us.net>
Date:   Tue, 11 May 2021 06:35:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511062953.485252-1-juergh@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 11:29 PM, Juerg Haefliger wrote:
> The valid range for the 'timeout' value is useful information so expose
> the min and max timeout values via sysfs.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v1->v2:
>   - replace sprintf() with sysfs_emit().
> 
>   drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index fe68a97973a5..7c1007ab1b71 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -526,6 +526,24 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>   }
>   static DEVICE_ATTR_RO(timeout);
>   
> +static ssize_t min_timeout_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", wdd->min_timeout);
> +}
> +static DEVICE_ATTR_RO(min_timeout);
> +
> +static ssize_t max_timeout_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", wdd->max_timeout);
> +}
> +static DEVICE_ATTR_RO(max_timeout);
> +
>   static ssize_t pretimeout_show(struct device *dev,
>   			       struct device_attribute *attr, char *buf)
>   {
> @@ -610,6 +628,8 @@ static struct attribute *wdt_attrs[] = {
>   	&dev_attr_state.attr,
>   	&dev_attr_identity.attr,
>   	&dev_attr_timeout.attr,
> +	&dev_attr_min_timeout.attr,
> +	&dev_attr_max_timeout.attr,
>   	&dev_attr_pretimeout.attr,
>   	&dev_attr_timeleft.attr,
>   	&dev_attr_bootstatus.attr,
> 

