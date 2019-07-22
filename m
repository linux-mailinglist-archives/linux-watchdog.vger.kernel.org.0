Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022A76F6B1
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 02:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfGVAFU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Jul 2019 20:05:20 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:39696 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfGVAFU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Jul 2019 20:05:20 -0400
Received: by mail-pg1-f182.google.com with SMTP id u17so16772961pgi.6
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Jul 2019 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KJvt/mIVwDvAaHDoBP/5q+H1oizJ/h1LMdo0AlJWNis=;
        b=DrrDmz+Q2j3GeUCyeoaH9PuivtKjnSovaoO6ex6DKE7lU+4YQlGE9T8foO73K2aNy5
         6j6NgfW89UJpaFtGxL46jEtWEfBnsn29X53WdqE5LFtU/9vlAssJiWke8r9fhAKRaEg/
         67wEsAIJmmfA29zBXSwO2awGk75xp2tgp9qLOmweLxd8morGWTOpYMDJTzq5tdR6UNj7
         N71xanUmA4xmfWqZoewbf+qv3uP4dO73p7rkqzpS0Ms+ZFusw0mQDT2tfWSDDDUOMkJf
         QN8qlH3E28UhzgACRn8ncjO048RrAgIe5P8ATz7ZThrDB557yWw40YtyB9E+Z0v+4wVP
         Qo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KJvt/mIVwDvAaHDoBP/5q+H1oizJ/h1LMdo0AlJWNis=;
        b=Nmwr2Q1IF+ltJMuMXZr4syXS8exlTfls/+a7t4lRD2r+rb47kYW27nbOlCabB+/fN4
         +7FcfkiL4EK0AMkJlfDiFvXzEcRU6xaWRryBwbPhFvSY4GJnqxGMLirjOFN93+2dM1Uk
         TJgJdkCFRt7ecnxEK6Utr7FzXNhdTpjC/oa3cRmuNlmRJ65dpNPRASKwD9DDF1BJddZK
         rH55w41n3YG/1DKp1XYz++OoTOPlhHzfJ5yR8F+xbsBHM+xi5nvdekBWuvCc1orNakkZ
         8cQUwpa+7E4F+OWacw9XdtaoQTMNjbI4UuoD7MSDR58EmRnUhBz8F2vsxKM9CFMukvba
         FMCQ==
X-Gm-Message-State: APjAAAWqbaVHS3qzCbz8UWIKjpVVCC3DG0gEDHmgHrPSM0zFoYg/NVuj
        h6TgQ8uUq/NIhYtuiMV7I5DaKys+
X-Google-Smtp-Source: APXvYqy/LW+UjmI/bJ6ke08uFs0Uf5Y2ZacP3TS0bXKZGXE/lU6wQvb+URjfGiX3h0FfbCLNTFkoKA==
X-Received: by 2002:a63:ec03:: with SMTP id j3mr42389281pgh.325.1563753919063;
        Sun, 21 Jul 2019 17:05:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm33492603pfa.162.2019.07.21.17.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 17:05:18 -0700 (PDT)
Subject: Re: iTCO_wdt on Intel NUC
To:     =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@valentin-vidic.from.hr>,
        linux-watchdog@vger.kernel.org
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
Date:   Sun, 21 Jul 2019 17:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/21/19 1:30 PM, Valentin Vidić wrote:
> Hello,
> 
> I'm having trouble getting iTCO_wdt to work on NUC8i5BEH with kernel 4.19.37-5+deb10u1:
> 
> [    9.346099] iTCO_vendor_support: vendor-support=0
> [    9.377211] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    9.377397] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
> [    9.377407] iTCO_wdt: probe of iTCO_wdt failed with error -16
> 
> Is there a way to check if the TCO hardware is missing in this machine
> or something else needs to be updated to get it working?
> 

Most likely the memory region is reserved/used by something else. /proc/iomem
might show you.

Guenter
