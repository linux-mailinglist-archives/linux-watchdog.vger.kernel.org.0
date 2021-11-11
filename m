Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDA844D54E
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 11:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhKKKxt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 05:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKKxs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 05:53:48 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1B9C061766;
        Thu, 11 Nov 2021 02:50:59 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id w30-20020a4a355e000000b002c2649b8d5fso1722277oog.10;
        Thu, 11 Nov 2021 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sgfSinyHGj1jS2Q6hf30aMZki2lF2HQ23b6CcBu4Wbw=;
        b=SMpIkJZVOZtBgOCYICBl4dtmZQta+QxT5l9KwbM6+3B2esD3j5SLq2anDVfeBLNTAF
         Q2QeD6Sl1hZ8lP0Ge/V7oYNvSpl+CNG9X7NfGV8seA3a5wiKuECdFTxJbqjb3WWlVVtr
         FivZVpJhk91D8Az5QIDjrLX1682gRCBe7e4O2StxQ6uuqtDVN9mfMytMZ1cpCYeKBi2B
         On3djYng5Vc1jTsHo2d9PpZLD/51x+/TUd/f+8+6POLBda5axBAysJh6YdKpx5/4pgb/
         4JHlUtd0zBUsjLER9H7ln5Va1ObHAVSl93nvHqkOInN5jam65gINrU8waIiGbLZNaHlM
         i0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sgfSinyHGj1jS2Q6hf30aMZki2lF2HQ23b6CcBu4Wbw=;
        b=z9dLO+6hwdClm9R88AtSFX+c//Th6P3cvACkASLO8yUWgXtIfgjajJqpcUjCDvmXSP
         8UCcZEP35nTtiUj7XCNYu+RwKPKbxVD03EGkuSbTIWmgyljdUTMwviyEs+tEp+wJyaVj
         gIZEjlwzZXETctGi/8HndKHpNmu8w3NTgjvfSmY/7rH4+h4YJsdu7XW89M/7nEOqhsT8
         IIxImaD2yU5patu2+EqAbhz+K9km9e0tAi9hTMPir2dQWMM/l6fEY+VfTcs0OtLubOAs
         T4py8I5+UB704Qj1P/uKeieYhtuVjY1T2JK2Pcmh0miOHFm2cXd9P03zOuL3XQE3kg6N
         t0vA==
X-Gm-Message-State: AOAM532WYhIwKpPW/mCr5a2Nx3AioOPAH4nsVxUG95zbEGkQ+CZoqY2E
        +lFnSzUKPLcBCHmCfmKKdJYi/G4rBoo=
X-Google-Smtp-Source: ABdhPJxVFiDZ9ouHhsqy6YH3TrCdDiFPxBXNrYIEWPePpIQ/mP3Uw3q+CR5KPG5VgotaEjahH5cAOA==
X-Received: by 2002:a4a:57c7:: with SMTP id u190mr3585241ooa.71.1636627858261;
        Thu, 11 Nov 2021 02:50:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o7sm566714ota.18.2021.11.11.02.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:50:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20211111085225.7090-1-biju.das.jz@bp.renesas.com>
 <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
 <7fd9b931-32f1-73a7-7750-a4224cf89500@roeck-us.net>
 <OS0PR01MB5922B2C8928EC22AFF8BF23386949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <24319fb4-cc3a-1923-7238-db42ed93e51e@roeck-us.net>
Date:   Thu, 11 Nov 2021 02:50:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922B2C8928EC22AFF8BF23386949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/21 2:35 AM, Biju Das wrote:
[ ... [
>>> +
>>> +	ret = devm_add_action_or_reset(&pdev->dev,
>>> +				       rzg2l_wdt_reset_assert_pm_disable_put,
>>> +				       &priv->wdev);
>>> +	if (ret < 0)
>>> +		goto out_reset;
>>
>> _or_reset implies that the action is taken on failure, so there is not
>> need to do it again.
> 
> As per [1], it can return -ENOMEM, in that case I don't get action callback. On a safer side
> I will move this call after watchdog_set_drvdata()
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/base/devres.c#L734
> 

That points to devm_add_action(), not to devm_add_action_or_reset().

Guenter
