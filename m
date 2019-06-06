Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D389A37AB0
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfFFRNH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 13:13:07 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:36867 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbfFFRNG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 13:13:06 -0400
Received: by mail-pg1-f178.google.com with SMTP id 20so1720321pgr.4
        for <linux-watchdog@vger.kernel.org>; Thu, 06 Jun 2019 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=29gbBbNXHYM53YDPOQ/jHmd0eE6eCdEN2scdSCKGzTA=;
        b=JkM/7nsVqgOKtnTmPZdqVG4wgYckjth6FC17UT1ZQA7XoPfZtIgqAQalYaT53Hb3o3
         vr+ql05voEh8NfsZcBjexd00KDvRpxFD4sxu9lbqpl5qy8KYzKy3wwzFLernv4aw+DJX
         b76bzupSQN1ag0onRN0OWIh73vBbhpF3VM1F4SApbAWmgsN3YW4VE4Yqy+sK9hZ3vkKq
         377u6lowQ7PCv8qkmHUDo6eyvtnLpv55V+ZQHNW5DtErdSN6NWyUVUql+XUpKl7FMPIU
         wyTfFx5pS0r5B0237uWXALxV974IGPmuS1FiowiADgj5tGtGkQX44BRF6qHSTzCjtteg
         829A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=29gbBbNXHYM53YDPOQ/jHmd0eE6eCdEN2scdSCKGzTA=;
        b=Y2rJuyyY6kpURr3iLub3jVeLLcygiRcE4W4EgHVmRTMwZTd/4WAmaxPmcngg7XWlnr
         5AB/Hbx1d6A/cURnx3lAb2pLEvr8dtB/ItRFIo5+GjdnofgwRWMCk89TQvj/DiFVgHQJ
         k03uslxdyQwctrHmPGTJ5lFY0i5YnsquyqbVv0MxcTU/NiaXXvDQDkJL5LcYb8iAf3yC
         mT4cOqwAZezSy+B49Ev5MU/z5gYP7z+AAd8nXm63oH01csn3+rf2bFb1HYuYoa+srznN
         CHfc9SYHrN0cuKYGHnyOY3FvdafWcN0oJayanEqFLd921mK5gNzVv7EzMyDFgDMkRpYS
         X7xA==
X-Gm-Message-State: APjAAAUbm5IUfVf+RdfBf4oaL1jfyAtiUvQ4PbuJ0JE+pns6SE+g71Hx
        lK7q8TJVxdi1AABAtUckI2M=
X-Google-Smtp-Source: APXvYqzHXPVlyNZS3oReMKB1h11DVIbsK2G4MseLaM01HxxgtdT8W9KnGDfYgi4D8U8HQ8hcN1LQQw==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr4033210pgx.403.1559841186338;
        Thu, 06 Jun 2019 10:13:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p63sm2702435pfb.70.2019.06.06.10.13.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 10:13:05 -0700 (PDT)
Date:   Thu, 6 Jun 2019 10:13:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Karel Zak <kzak@redhat.com>
Cc:     Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org
Subject: Re: RFE: export watchdog features and version by /sys
Message-ID: <20190606171304.GA313@roeck-us.net>
References: <20190606100131.2xgrs5cmtnj4hjyb@ws.net.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606100131.2xgrs5cmtnj4hjyb@ws.net.home>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 06, 2019 at 12:01:31PM +0200, Karel Zak wrote:
> 
>  Hi,
> 
>  I'd like to improve wdctl(8) to read watchdog info from /sys, but I
>  found that sysfs does not provide all information like ioctl API.
> 
>  Unfortunately, there is no way how from /sys get info about supported
>  watchdog features and firmware version. This info is accessible only 
>  by WDIOC_GETSUPPORT ioclt (struct watchdog_info->options and
>  watchdog_info->firmware_version).
> 
>  It would be nice to have "options" and "firmware_version" also in in
>  sysfs. Please :-)
> 

Makes sense. Care to submit patches implementing it ?

We would have to resolve the conflict against the existing
firmware_version attribute provided by ziirave_wdt.

Thanks,
Guenter
