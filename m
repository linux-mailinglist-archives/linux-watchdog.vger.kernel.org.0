Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4481637F106
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 03:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhEMByF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 21:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhEMByE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 21:54:04 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D567C061574
        for <linux-watchdog@vger.kernel.org>; Wed, 12 May 2021 18:52:53 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso5359649ooh.11
        for <linux-watchdog@vger.kernel.org>; Wed, 12 May 2021 18:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5mUons8YwS7WKuwWFuuodYjo53U6i9GClHKb5atmwik=;
        b=b4Yn3zBrTQgwcmM8tCxJ/Yqk/eW3pOl+IB9qhzyCf3HDAaKao6FBpl3xZXyFXJ0JvB
         Y982gu1s5jeDKFu52YGNYktX5OKygDU8dY9fVa4wEcbt6l+LhrDyz5l7xPATBLAA5e88
         SJQUleVvuhc2TBIM0BNdAKPn+9BIyavwbaqfgBNc3fsgsY+PDQHp+RguQyqrNa5TFMla
         jui0K7iG5gF/37br64VNlqDtSU/hHOkflU/zjrCQFhmz96+aXpbMfA2AuuTEFmr5rtr7
         hYkF7EU3xPSOcp7Q5DeHaMFFsmQKk3IbBj5v4ovvzgpGuKt04g6zIuTCNV8R3ZC5gZ2A
         NYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5mUons8YwS7WKuwWFuuodYjo53U6i9GClHKb5atmwik=;
        b=j0IEdUHS5V4V/4l4nDg7QTPihVp5uUVf3xiqIGwd2NyLVuWFxi8zzeIBa38fWzb7cE
         adpdd2mC2p0WrDnhckyWOLrYtZgQgftVBmXdayFaHcVND/x7IM5yY9XZV2PV+doj7Nca
         FwlCMS5QtYG3QudhgJqLQR1YeDmlEc/1jNrDC6ULYdSf8wmihsjruKYTegVjguH7Mb3Q
         ereJbpE1s+vyzmhCbekMoxjXjthDMrDaLnrvW1Cx5HUJC4+5yIFWwwt872VWb/onF/lt
         N8fN0jHsKe+nTNtkfWhxCoRuIUS9sk9VK9QNqjvQSHJtpE9L8m7gu1qzn5qxZktc9xtU
         pIfA==
X-Gm-Message-State: AOAM530KTSBFlREKfPhhE3khmtRyxTYVJEfK9yRf33ezR4xIsVaPeU7g
        AjVBNlhtGawJhjc4P3JEv7dt1XiQ6Dw=
X-Google-Smtp-Source: ABdhPJwPIEKh9xDfSotUR37YMl8NBBzvKM62JL+zB/xsI9SLODHPHLYMZ1hayoCoG09lSJCCmwexzw==
X-Received: by 2002:a4a:ce8f:: with SMTP id f15mr30262657oos.8.1620870772218;
        Wed, 12 May 2021 18:52:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9sm354627otq.27.2021.05.12.18.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 18:52:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog/hpwdt: New PCI IDs
To:     Jerry Hoemann <jerry.hoemann@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1620865548-11895-1-git-send-email-jerry.hoemann@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <69496131-2509-4c9f-2d4f-3d231fe99a6a@roeck-us.net>
Date:   Wed, 12 May 2021 18:52:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620865548-11895-1-git-send-email-jerry.hoemann@hpe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/21 5:25 PM, Jerry Hoemann wrote:
> New hardware with new PCI ID info.
> ---

Patches are not acceptable without Signed-off-by: tag, sorry.

Guenter


>   drivers/watchdog/hpwdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index 22ddba3..a5006a5 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -45,6 +45,7 @@
>   static const struct pci_device_id hpwdt_devices[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_COMPAQ, 0xB203) },	/* iLO2 */
>   	{ PCI_DEVICE(PCI_VENDOR_ID_HP, 0x3306) },	/* iLO3 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_HP_3PAR, 0x0389) },	/* PCtrl */
>   	{0},			/* terminate list */
>   };
>   MODULE_DEVICE_TABLE(pci, hpwdt_devices);
> 

