Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E172D482776
	for <lists+linux-watchdog@lfdr.de>; Sat,  1 Jan 2022 13:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbiAAMFt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 1 Jan 2022 07:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbiAAMFt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 1 Jan 2022 07:05:49 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2142EC061574
        for <linux-watchdog@vger.kernel.org>; Sat,  1 Jan 2022 04:05:49 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso19740839pje.0
        for <linux-watchdog@vger.kernel.org>; Sat, 01 Jan 2022 04:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=oo2A+04vMxz6FLXl9iXHOLNQfIitEPl2ZSnaI4d0HT9KnTzqvf1bkWls+FpyR+hOYm
         gGNQowOKzeDNZDSy9bUwryL2dlFcTP8t6Ox5CrKlgVb+hgIMCxzaje9lk9b6WTuOmjYY
         ME61hi2qlAnB+qDibs3jthIzhq14wpSp5AXCs91wn5ZXGpO6ytiE00BJCzeHyscUdoGt
         QhGNzpbX9A4y3N/VPOX0FgRFkECfPul0GHD3FEtLgcWHW8ZGRBjHHR23n/DQHyjT7g6i
         KZqgh+waPTD6MZqzphnPbngfdU5l/ctopNEepkt1EAVAWz4uPM3EC6ObEFDmGA76jKdC
         xJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=dW5+jV0JmiDmh7Z2hJ+32W4PE1kskQd3r6IqQzmHvkaWi7o5jHWc2kiJnFcLTGWfcI
         u11UvQdO14snvI7g6QyNNa3+kwG5GOdloYiiPzWxegWSzWIEzWqIbvbGYlJKEW+Go4lq
         T0quJLwMjpzYakTUcF5WxhQFPr+Qa02X4BxR312eRVLoDl3hDGU4sF7D813TqIxxGU3r
         L3gmclZkwpbH8ih5zv6NIbevinBmCqPtDPsSszfCs0u716ABksgsiabcvqYQhkATY7QA
         y5DFWQAki7foznwPvNzDjFhmO1wfXJAsy3ur5iA2Hxq5yilZsHUNtUPFGyI4PA0fUNh9
         828g==
X-Gm-Message-State: AOAM530nNN16qq28uqbUhDNdy8g7Gh8hsVafxA6ZFYkGhPB6LJCrdj90
        alfmWVcVo+hBhTKRf2i296w=
X-Google-Smtp-Source: ABdhPJyM1zIfit9eKveeGOZiz1PAxQ1IXx+/dJTn43yM+KcgaYA/naq/SIAVFTbW5oYEqCzloxeH3g==
X-Received: by 2002:a17:902:6a88:b0:149:848f:1e8b with SMTP id n8-20020a1709026a8800b00149848f1e8bmr25296289plk.124.1641038748761;
        Sat, 01 Jan 2022 04:05:48 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id w13sm27606619pgm.5.2022.01.01.04.05.39
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:05:48 -0800 (PST)
Message-ID: <61d0439c.1c69fb81.c547a.d7e3@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:05:30 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

