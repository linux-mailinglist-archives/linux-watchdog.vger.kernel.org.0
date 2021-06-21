Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D45C3AE2FD
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jun 2021 08:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFUGOC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Jun 2021 02:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhFUGN6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Jun 2021 02:13:58 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E05C061574
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Jun 2021 23:11:44 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id x12so14237873ill.4
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Jun 2021 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMOacCUVxIkKoB2CAKwTgiKnjRqpZaGysTfPqeXImQc=;
        b=lncX7f1GdteiNPCdRxtaRd1qBnCKLQE2b6yk+By0toNDvm+BdNVeB0/f+2sI5hzSmR
         02oghVxH6sT31iQvjKvhbnIHkNm9+RWHtTG0PBgBRRz1K8pLAd8ZPeHOSBC2IrWD9+/9
         6DEwRGtxVVUGlJ3slJcltzCctb83jTDddG1FKVp5eVvjgJLBN0Jha5aw1wixGcpvW9zt
         ZtlfnOhN3uSkhIMlJyOWieC7TFKx1a+5SLDoEf93hG69tD5S56K8AKRzv/Z6tr5Lq/7F
         nDcwcd8GmnoFrRx/BJ8X0W/RUvyPHqElrE2jvgLKuRmVsNQxldiq2d6TbdoKckVAYQ4S
         Onkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMOacCUVxIkKoB2CAKwTgiKnjRqpZaGysTfPqeXImQc=;
        b=Tobj1OUO+4fRoGXJUhwUxAzTcXaAx7AQLB70vDb7D92Qd+fqNmip+5keI04O2l5Uue
         GqZPI9YW7NxLER4FZoTS3DxCIrQnifqxKWjHk87Wfzkt+blUnqNPVbeAkKTjH/Agvkv2
         2uRcoz3trcm+z7S88ziv2ck8ckRr85fbOAG6ygA7bQo1CyYoBiLeSt60iAyu2QfQYAbd
         Abn0ePNCUzctRFugyFw/o98X2qqSN6tRhaw3k2/hW6fKjVfsvCzQkPhShflVMcCtQTbA
         1+eREzXgf0GxQnMkMTADLLsKb6qwNsP7ewWXb4evy9fauHql+uIT5pVNnw2qsie0WDll
         TaaA==
X-Gm-Message-State: AOAM532aA4tOcY75CQz8xy/YfsU5K0Z1R1YZHFUJmSDOcKZQiU73hZIi
        6tKcrY3pbJRrz+Wz9IujbCw8STA+c/Ji5rSeHGTHeA==
X-Google-Smtp-Source: ABdhPJyBUx+kDh5PhVgm49aok5ViJo5axj804RUR4VXWG5zl53SfBNieGoNHqgkLRe36C71utxsarKSrRKqntMmTLfE=
X-Received: by 2002:a05:6e02:16c5:: with SMTP id 5mr8911651ilx.72.1624255903713;
 Sun, 20 Jun 2021 23:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 21 Jun 2021 14:11:32 +0800
Message-ID: <CA+Px+wXWMRM_O7Y8h50DWoKfMapgMzuVppe7AaRPDiRdWDF06g@mail.gmail.com>
Subject: Re: [v1,0/3] watchdog: mt8195: add wdt support
To:     Christine Zhu <christine.zhu@mediatek.com>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org,
        rex-bc.chen@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> christine.zhu (3):
>   dt-binding: mt8195: update mtk-wdt document
>   dt-binding: mt8195: add toprgu reset-controller head file
>   watchdog: mt8195: add wdt support
Please provide some information in the cover letter to let people know
what the series fixes about.
