Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E2D3764DA
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 May 2021 14:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235819AbhEGMFE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 May 2021 08:05:04 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:49524 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbhEGMFD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 May 2021 08:05:03 -0400
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te654d69a59ac14110e2488@ACLMS4.ADVANTECH.CORP>;
 Fri, 7 May 2021 20:03:48 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 20:03:48 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     <robh@kernel.org>
CC:     <campion.kang@advantech.com.tw>, <chia-lin.kao@canonical.com>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <hdegoede@redhat.com>, <jdelvare@suse.com>, <lee.jones@linaro.org>,
        <linux-doc@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <wim@linux-watchdog.org>
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded controller entry
Date:   Fri, 7 May 2021 20:03:47 +0800
Message-ID: <20210507120347.27286-1-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507005006.GA854303@robh.at.kernel.org>
References: <20210507005006.GA854303@robh.at.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 01A26C7359DB37B0FA7B736665FC203ACD2687985A6849E28AE9921DA234C2DE2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

>-----Original Message-----
>From: Rob Herring <robh@kernel.org>
>Sent: Friday, May 7, 2021 8:50 AM
>Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0
>embedded controller entry
>
>On Thu, May 06, 2021 at 10:47:22AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> I'm replying here since this series has no cover-letter, for
>> the next version for a series touching so many different
>> sub-systems it would be good to start with a cover-letter
>> providing some background info on the series.
>>
>> I see this is binding to an ACPI device, yet it is also using
>> devicetree bindings and properties.
>>
>> So I take it this means that your ACPI tables are using the
>> optional capability of embedded device-tree blobs inside the
>> ACPI tables ?
>
>Ugg, really. I would have stopped caring if I had realized.

I am very grateful for any comments you have made in the past, and please feel free to give friendly guidance.

